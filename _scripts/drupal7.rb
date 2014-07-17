# NOTE: This converter requires Sequel and the MySQL gems.
# The MySQL gem can be difficult to install on OS X. Once you have MySQL
# installed, running the following commands should work:
# $ sudo gem install sequel
# $ sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

#
# TODO
# - use filter_format flag, fdb.body_format, to pre-process HTML and maybe Wiki to Markdown
# - Pull in tags from the various taxonomies.
# Look through field_data_taxonomy* for terms applied to nodes.
# For those terms, load them in from taxonomy_term_data.
# If we wish to retain the hierarchy (somehow), pull the parent relationships in from taxonomy_term_heirarchy.
# - Retain Book structure and additional fields?
# - Menus? Needed for book structure I think. Uses menu_links although book module ties menu link IDs to book and node ids.
# - Retain image files for Image nodes?
# image.nid & image_size = _original gets the fid
# - Files and attachments more generally. (36,562 total! a lot of thumbnails and previews)
# file_usage links nodes to file_managed
# - Retain additional fields from weblink.url, event.start?, quote.author, projects (no data)?
# - Check pages and stories for additional fields?
# comments?
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
  # convert triple prime bold (e.g. ''''bold'''') to Markdown format (e.g. '__bold__')
  data = data.gsub(/(?<!')'''(.+)'''(?!')/, '__\1__')
  # convert double prime emphasis (e.g. '''emphasis''') to Markdown format (e.g. '_emphasis_')
  data = data.gsub(/(?<!')''(.+)''(?!')/, '_\1_')
  # convert headings (e.g. '!!Heading') to Markdown atk-style format (e.g. '## Heading')
  data = data.gsub(/^!{1}([^!]+)$/, '# \1')
  data = data.gsub(/^!{2}([^!]+)$/, '## \1')
  data = data.gsub(/^!{3}([^!]+)$/, '### \1')
  data = data.gsub(/^!{4}([^!]+)$/, '#### \1')
  data = data.gsub(/^!{5}([^!]+)$/, '##### \1')
  data = data.gsub(/^!{6}([^!]+)$/, '###### \1')
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

      def self.process(options)
        dbname = options.fetch('dbname')
        user   = options.fetch('user')
        pass   = options.fetch('password', "")
        host   = options.fetch('host', "localhost")
        prefix = options.fetch('prefix', "")

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

          # Get the relevant fields as a hash, delete empty fields and convert
          # to YAML for the header
          data = {
             'layout' => 'post',
             'title' => title.to_s,
             'created' => created,
             'permalink' => node_alias,
          }.delete_if { |k,v| v.nil? || v == ''}.to_yaml

          # Convert the content if appropriate:
          if post[:body_format] == "1"
            print("\n---------\n")
            print(content)
            content = phpwikiToMarkdown(content)
            print("\n")
            print(content)
          end

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
      "prefix"   => ""
    })
