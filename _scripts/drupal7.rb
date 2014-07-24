# NOTE: This converter requires Sequel and the MySQL gems.
# The MySQL gem can be difficult to install on OS X. Once you have MySQL
# installed, running the following commands should work:
# $ sudo gem install sequel
# $ sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

#
# TODO
# If we wish to retain the hierarchy (somehow), pull the parent relationships in from taxonomy_term_heirarchy.
# - PLUS [image:728,left,10,5] in (wiki?) posts?
# - Retain additional fields from weblink.url, event.start?, quote.author, projects (no data)?
# - Check pages and stories for additional fields?
# - comments?
# - Retain Book structure and additional fields?
# - Menus? Needed for book structure I think. Uses menu_links although book module ties menu link IDs to book and node ids.
#

require 'jekyll-import'
require 'pp'

def htmlToMarkdown(data)

end

# based on : https://gist.github.com/morgant/924688
def phpwikiToMarkdown(data)
  # convert CamelCase (starting w/capital; e.g. 'NewtonNewbieGuide') to wiki links (e.g. '[[NewtonNewbieGuide]]')
  #data = data.gsub(/(^|\b|_)((?<![\[|])[A-Z][a-z]+[A-Z][A-Za-z]+(?![\]|]))($|\b|_)/, '\1\[\[\2\]\]\3')
  # convert non-URI links in square brackets (e.g. '[NewtonConnectivityCD]') to wiki links (e.g. '[[NewtonConnectivityCD]]'
  ##data=$(echo -n '$data' | sed -E 's/([^[])\[([^\s]+)\]([^]])/\1\[\[\2\]\]\3')
  #data = data.gsub(/((?<!\[)\[[A-Za-z0-9]+\](?!\]))/, '\[\1\]')
  # convert non-URI, named links in square brackets (e.g. '[BluetoothConnection|UsingBluetoothIndex]') to Markdown link format (e.g. '[BluetoothConnection](/UsingBluetoothIndex)')
  #data = data.gsub(/(?<!\[)\[(.+)\s?\|\s?([A-Za-z0-9]+)\](?!\])/, '[\1](\2)')
  # convert URI, named links in square brackets (e.g. '[Newtontalk.net|http://www.newtontalk.net/]') to Markdown link format (e.g. '[Newtontalk.net](http://www.newtontalk.net/)')
  data = data.gsub(/(?<!\[)\[([^\|\]\()]+)\s?\|\s?([A-Za-z]+:(\/\/)?[^ \]]+)\](?!\])/, '[\1](\2)')
  # convert non-URI, named links in square brackets (e.g. '[http://this UsingBluetoothIndex]') to Markdown link format (e.g. '[BluetoothConnection](/UsingBluetoothIndex)')
  data = data.gsub(/\[([A-Za-z]+:[^ \]]+) ([^\]]+)\]/, '[\2](\1)')
  # convert URI-only links in square brackets (e.g. '[http://tools.unna.org/glossary/]') to angle bracket format (e.g. '<http://tools.unna.org/glossary/>')
  #data = data.gsub(/(?<!\[)\[([A-Za-z]+:(\/\/)?.+)\](?!\])/, '<\1>')
  # also convert 'naked' http or https links:
  data = data.gsub(/(?<![\[\("<])(https?:\/\/[\S]+)/, '<\1>')
  # convert triple prime bold (e.g. ''''bold'''') to Markdown format (e.g. '__bold__')
  data = data.gsub(/(?<!')'''(.+)'''(?!')/, '__\1__')
  # convert double prime emphasis (e.g. '''emphasis''') to Markdown format (e.g. '_emphasis_')
  data = data.gsub(/(?<!')''(.+)''(?!')/, '_\1_')
  # PHP Wiki blockquotes:
  data = data.gsub(/^\s*;:(.+)$/,  "\n> \\1")
  # convert headings (e.g. '!!Heading') to Markdown atk-style format (e.g. '## Heading')
  data = data.gsub(/^!{1}([^!]+)$/, '# \1')
  data = data.gsub(/^!{2}([^!]+)$/, '## \1')
  data = data.gsub(/^!{3}([^!]+)$/, '### \1')
  data = data.gsub(/^!{4}([^!]+)$/, '#### \1')
  data = data.gsub(/^!{5}([^!]+)$/, '##### \1')
  data = data.gsub(/^!{6}([^!]+)$/, '###### \1')
  # convert lists:
  data = data.gsub(/^\*{1}([^\*]+)$/, '* \1')
  data = data.gsub(/^\*{2}([^\*]+)$/, '    * \1')
  data = data.gsub(/^\*{3}([^\*]+)$/, '        * \1')
  data = data.gsub(/^\*{4}([^\*]+)$/, '            * \1')
end

module JekyllImport
  module Importers
    class Drupal7Custom < Importer
      # Reads a MySQL database via Sequel and creates a post file for each story
      # and blog node.
      QUERY = "SELECT n.nid, \
                      n.title, \
                      fdb.body_value, \
                      fdb.body_format, \
                      n.created, \
                      n.changed, \
                      n.status, \
                      n.type, \
                      n.promote, \
                      n.* \
               FROM node AS n, \
                    field_data_body AS fdb \
               WHERE n.nid = fdb.entity_id \
               AND n.vid = fdb.revision_id"

#               WHERE (n.type = 'blog' OR n.type = 'story' OR n.type = 'article') \

      def self.validate(options)
        %w[dbname user].each do |option|
          if options[option].nil?
            abort "Missing mandatory option --#{option}."
          end
        end
      end

      def self.specify_options(c)
        c.option 'dbname', '--dbname DB', 'Database name'
        c.option 'user', '--user USER', 'Database user name'
        c.option 'password', '--password PW', 'Database user\'s password (default: "")'
        c.option 'host', '--host HOST', 'Database host name (default: "localhost")'
        c.option 'prefix', '--prefix PREFIX', 'Table prefix name'
      end

      def self.require_deps
        JekyllImport.require_with_fallback(%w[
          rubygems
          sequel
          fileutils
          safe_yaml
        ])
      end

      def self.get_taxonomy_terms(db, table, node_id)
          tax_query = "SELECT tt.* \
               FROM field_data_#{table} AS td, \
                    taxonomy_term_data AS tt \
               WHERE tt.tid = td.#{table}_tid \
                 AND td.entity_type = 'node' AND td.entity_id = '#{node_id}'"
          # Copy files found for this node into the folder structure:
          terms = Set.new
          db[tax_query].each do |t|
            terms.add(t[:name])
          end
          return terms
      end

      def self.process(options)
        dbname = options.fetch('dbname')
        user   = options.fetch('user')
        pass   = options.fetch('password', "")
        host   = options.fetch('host', "localhost")
        prefix = options.fetch('prefix', "")
        filebase = options.fetch('filebase',".")

        db = Sequel.mysql(dbname, :user => user, :password => pass, :host => host, :encoding => 'utf8')

        unless prefix.empty?
          QUERY[" node "] = " " + prefix + "node "
          QUERY[" field_data_body "] = " " + prefix + "field_data_body "
        end

        FileUtils.mkdir_p "_posts"
        FileUtils.mkdir_p "_drafts"
        FileUtils.mkdir_p "_layouts"

        db[QUERY].each do |post|
          #pp(post)
          # Get required fields and construct Jekyll compatible name
          node_id = post[:nid]
          title = post[:title]
          content = post[:body_value]
          created = post[:created]
          time = Time.at(created)
          is_published = post[:status] == 1
          if post[:type] == "blog"
            dir = is_published ? "_posts" : "_drafts"
          else
            dir = post[:type]
            FileUtils.mkdir_p dir
          end
          slug = title.strip.downcase.gsub(/(&|&amp;)/, ' and ').gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
          name = time.strftime("%Y-%m-%d-") + slug + '.md'

          # Look for permalinks from the aliases:
          alias_query = "SELECT alias FROM url_alias WHERE source = 'node/#{node_id}'";
          node_alias = db[alias_query].first
          if node_alias != nil
            node_alias = "/" + node_alias[:alias] + "/"
          end

          # Look for relevant taxonomy entries:
          terms = self.get_taxonomy_terms(db, "taxonomyextra", node_id)
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_2", node_id))
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_3", node_id))
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_7", node_id))
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_9", node_id))
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_10", node_id))

          # Look for related files:
          file_query = "SELECT fm.* \
               FROM file_usage AS fu, \
                    file_managed AS fm \
               WHERE fu.fid = fm.fid \
                 AND fu.type = 'node' AND fu.id = '#{node_id}'"
          # Copy files found for this node into the folder structure:
          db[file_query].each do |f|
            src = f[:uri].gsub(/public:\/\//, filebase)
            if post[:type] == "image"
              dst = f[:uri].gsub(/public:\/\//, "#{dir}/")
            else
              dst = f[:uri].gsub(/public:\/\//, "#{dir}/files/")
            end
            dst = dst.gsub(/\/\//,"/")
            dst_file = File.basename(dst)
            if File.file?(src)
              FileUtils.mkdir_p(File.dirname(dst))
              FileUtils.cp(src, dst)
              if post[:type] == "image"
                content = "\n" + "<img src=\"/#{dst}\"/>" + "\n" + "\n" + content
              else
                content = "#{content}\n\n" + "Download: <a href=\"/#{dst}\">#{dst_file}</a>" + "\n"
                #print("cp #{src} to #{dst}\n")
              end
            else
              print("MISSING FILE #{src}\n")
            end
          end

          # Get the relevant fields as a hash, delete empty fields and convert
          # to YAML for the header
          data = {
             'layout' => 'post',
             'title' => title.to_s,
             'created' => created,
             'permalink' => node_alias,
             'tags' => terms.to_a,
          }.delete_if { |k,v| v.nil? || v == ''}.to_yaml

          # Convert the content if appropriate:
          if post[:body_format] == "1"
            content = phpwikiToMarkdown(content)
          end

          # Replace windows newlines:
          content = content.gsub(/\r/,"")

          # Write out the data and content to file
          File.open("#{dir}/#{name}", "w") do |f|
            f.puts data
            f.puts "---"
            f.puts content
          end

        end

        # TODO: Make dirs & files for nodes of type 'page'
          # Make refresh pages for these as well

        # TODO: Make refresh dirs & files according to entries in url_alias table
      end
    end
  end
end

    JekyllImport::Importers::Drupal7Custom.run({
      "dbname"   => "anjackson7",
      "user"     => "anj",
      "password" => "sql-4anj",
      "host"     => "localhost",
      "prefix"   => "",
      "filebase" => "/Users/andy/Sites/drupal-7-anj/sites/anjackson.net/files/"
    })
