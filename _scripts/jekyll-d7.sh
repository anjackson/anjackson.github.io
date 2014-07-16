# http://import.jekyllrb.com/docs/drupal7/
ruby -rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::Drupal7.run({
      "dbname"   => "anjackson7",
      "user"     => "anj",
      "password" => "sql-4anj",
      "host"     => "localhost",
      "prefix"   => ""
    })'
