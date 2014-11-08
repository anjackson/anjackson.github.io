# NOTE: This converter requires Sequel and the MySQL gems.
# The MySQL gem can be difficult to install on OS X. Once you have MySQL
# installed, running the following commands should work:
# $ sudo gem install sequel
# $ sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

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
  # convert triple prime bold (e.g. '''bold''') to Markdown format (e.g. __bold__)
  data = data.gsub(/(?<!')'''(.+?)'''(?!')/, '__\1__')
  # convert double prime emphasis (e.g. ''emphasis'') to Markdown format (e.g. _emphasis_)
  data = data.gsub(/(?<!')''(.+?)''(?!')/, '_\1_')
  # PHP Wiki blockquotes:
  data = data.gsub(/^\s*;:(.+)$/,  "\n> \\1")
  # convert headings (e.g. '!!Heading') to Markdown atk-style format (e.g. '## Heading')
  data = data.gsub(/^!{1}([^!]+)$/, '# \1')
  data = data.gsub(/^!{2}([^!]+)$/, '## \1')
  data = data.gsub(/^!{3}([^!]+)$/, '### \1')
  data = data.gsub(/^!{4}([^!]+)$/, '#### \1')
  data = data.gsub(/^!{5}([^!]+)$/, '##### \1')
  data = data.gsub(/^!{6}([^!]+)$/, '###### \1')
  # Convert preformatted sections (before lists to avoid problems):
  data = data.gsub(/^ {1,2}(.+)$/, '    \1')
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
                    field_revision_body AS fdb \
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

      def self.array_to_tree(bmls)
        # Rebuild a tree:
        nested_hash = Hash[bmls.map{|e| [e[:id], e.merge(children: [])]}]
        nested_hash.each do |id, item|
          parent = nested_hash[item[:parent_id]]
          parent[:children] << item if parent
        end

        # Grab the tops of the trees:
        tree = nested_hash.select { |id, item| item[:parent_id].nil? }.values

        # Strip out data we no longer need:
        nested_hash.each do |id, item|
          item.delete(:id)
          item.delete(:parent_id)
        end

        return tree
      end

      def self.get_menus(db)
        bm_query = "SELECT ml.* FROM menu_links AS ml"
        # Extract the link and parent information:
        links = []
        db[bm_query].each do |ml|
          links << { 
            :menu_name => ml[:menu_name],
            :id => ml[:mlid],
            :parent_id => ml[:plid],
            :path => ml[:link_path],
            :title => ml[:link_title]
          }
        end
        return links
      end

      def self.get_book_menus(db)
        all_links = self.get_menus(db)
        bmls = []
        for ml in all_links
          if ml[:menu_name].match(/^book-toc-/)
            # Switch to using 'nil' to denote roots:
            if ml[:parent_mlid] == 0
              ml[:parent_mlid] = nil
            end
            # Add node ID:
            ml[:node_id] = ml[:path].split(/\//)[1]
            # Remove unwanted data
            ml.delete(:menu_name)
            ml.delete(:path)
            # Keep it:
            bmls << ml
          end
        end

        # Build up flat and tree hashes of the book menu links:
        tree = self.array_to_tree(bmls)

        # Use node_id-to-permalink mapping to switch to the best paths:
        # TBA...

        return tree
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

        # Grab the book heirarchies:
        book_tree = self.get_book_menus(db)
        File.open('_data/books.yml', 'w') {|f| f.write book_tree.to_yaml }
        exit

        # Prepare to grab the posts
        FileUtils.mkdir_p "_posts"
        FileUtils.mkdir_p "_drafts"
        FileUtils.mkdir_p "_layouts"

        all_urls = []
        image_lookup = {}

        db[QUERY].each do |post|
          #pp(post)
          # Get required fields and construct Jekyll compatible name
          postdata = {
            'layout' => 'default',
            'type' => post[:type],
            'promote' => post[:promote],
            'status' => post[:status],
            'created_ts' => post[:created],
            'changed_ts' => post[:changed],
            'node_id' => post[:nid],
            'title' => post[:title],
            'author' => "anj"
          }

          # Grab the node ID:
          node_id = post[:nid]
          print("NID:"+node_id.to_s+" "+post[:title]+" \n")

          # Fix the author:
          if post[:uid] == 7
            postdata['author'] = "efj"
          end

          # Decide the filename etc.:
          time = Time.at(post[:created])
          postdata['created'] = time.strftime("%Y-%m-%d")
          mtime = Time.at(post[:changed])
          postdata['changed'] = mtime.strftime("%Y-%m-%d")
          is_published = post[:status] == 1
          title = post[:title]          
          slug = title.strip.downcase.gsub(/(&|&amp;)/, ' and ').gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
          if post[:type] == "blog"
            postdata['layout'] = "post"
            dir = is_published ? "_posts" : "_drafts"
            name = time.strftime("%Y-%m-%d-") + slug + '.md'
          else
            dir = post[:type]
            FileUtils.mkdir_p dir
            name = slug + '.md'
          end          

          # Look for permalinks from the aliases:
          postdata['redirect_from'] ||= []
          alias_query = "SELECT alias FROM url_alias WHERE source = 'node/#{node_id}'";
          for node_alias in db[alias_query]
            if node_alias != nil
              url_alias = "/" + node_alias[:alias] + "/"
            end
            postdata['permalink'] ||= url_alias
            postdata['redirect_from'] <<  url_alias
            all_urls << { 'href' => url_alias, 'title' => title }
          end
          url_alias = node_alias = "/node/" + node_id.to_s + "/"
          postdata['permalink'] ||= url_alias
          postdata['redirect_from'] <<  url_alias
          all_urls << { 'href' => url_alias, 'title' => title }
          # Remove the permalink from the redirects list:
          postdata['redirect_from'] = postdata['redirect_from'] - [ postdata['permalink'] ]


          # Look for relevant taxonomy entries:
          postdata['category'] = self.get_taxonomy_terms(db, "taxonomy_vocabulary_3", node_id).to_a.first
          terms = self.get_taxonomy_terms(db, "taxonomyextra", node_id)
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_2", node_id))
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_7", node_id))
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_9", node_id))
          terms.merge(self.get_taxonomy_terms(db, "taxonomy_vocabulary_10", node_id))
          postdata['tags'] = terms.to_a

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
                postdata['images'] ||= []
                postdata['images'] << { 'src' => dst, 'name' => dst_file }
                # Also override the layout in this case:
                postdata['layout'] = "image"
                # Also add an image look-up hook:
                image_lookup[node_id.to_s] = dst
              else
                postdata['attachments'] ||= []
                postdata['attachments'] << { 'src' => dst, 'name' => dst_file }
                #print("cp #{src} to #{dst}\n")
              end
            else
              print("MISSING FILE #{src}\n")
            end
          end

          # Get the relevant fields as a hash, delete empty fields and convert
          # to YAML for the header
          data = postdata.delete_if { |k,v| v.nil? || v == ''}.to_yaml

          # Deal with the content:
          content = post[:body_value]
          # Fix up [image:XX] links, which come in multiple forms:
          content = content.gsub(/\[image:([0-9]+)(.*?)\]/) do |match|
            nid = $1.to_s
            args = $2.to_s
            if args != ""
              align = ""
              width = ""
              hspace = ""
              vspace = ""
              if args.match(/^,/)
                parts = args.split(',')
                align = parts[1]
                hspace = parts[2]
                vspace = parts[3]
              else
                parts = args.split(" ")
                if parts[0].match(/left/)
                  align = "left"
                  parts = parts.drop(1)
                elsif parts[0].match(/right/)
                  align = "right"
                  parts = parts.drop(1)
                end
                for part in parts
                  if part.match(/^width=/)
                    width = part.sub(/^width=/,'')
                  elsif part.match(/^vspace=/)
                    vspace = part.sub(/^vspace=/,'')
                  elsif part.match(/^hspace=/)
                    hspace = part.sub(/^hspace=/,'')
                  end
                end
              end
              "{% include _image.html nid=\"#{nid}\" align=\"#{align}\" hspace=\"#{hspace}\" vspace=\"#{vspace}\" width=\"#{width}\" %}"
            else
              "{% include _image.html nid=\"#{nid}\" %}"
            end
          end
          # Convert the content if appropriate:
          if post[:body_format] == "1"
            content = phpwikiToMarkdown(content)
          else
            postdata['body_format'] = post[:body_format]
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
        
        # Write out the site map
        File.open("import_sitemap.md", "w") do |f|
          f.puts "---"
          f.puts "title: Site Map"
          f.puts "layout: default"
          f.puts "---"
          for entry in all_urls.sort_by { |hsh| hsh['href'] }
            f.puts "* [#{entry['title']}](#{entry['href']})"
          end
        end

        # Write out the image lookup table:
        File.open('_data/images.yml', 'w') {|f| f.write image_lookup.to_yaml }

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
