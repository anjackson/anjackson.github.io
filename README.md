anjackson.github.io
===================

This repository holds my efforts to convert my long-running Drupal site into a more maintainable static version.

To Do
-----

* Finalise import:
    * Retain Book structure and additional fields?
        * http://anjackson.net/book
    * Menus? Needed for book structure I think. Uses menu_links although book module ties menu link IDs to book and node ids.
        * Now extracted OK.
        * Need to map node_id's to permalinks, I think.
    * Retain additional fields from e.g. weblink.url, event.start?, quote.author, projects (no data)?
    * Weblink structure http://anjackson.net/admin/content/taxonomy/7
    * Check pages and stories for additional fields?
    * comments?
    * blocks? Not terribly exciting, but the Flick ones are ok.
    * http://anjackson.net/image and the taxonomy heirarchy http://anjackson.net/admin/content/taxonomy/2
    * aggregator?
    * delicious_link etc (out of date)
    * events (appear to hook dates and locations together? World trip probably.)
    * taxonomyextra?
    * freelinking has a few links in it. 
    * menus (more?)
    * node_counter ?
    * quotes
    * weblink
* Get attachments working properly. DONE.
* Add side-bar to images?
* Add a /blog/categories/ page.
* Add 'missing' (i.e. DB-generated) pages:
    * /books/?
    * /images/ (sometimes also called img-n) elsewhere.
* Update /work/ section, as appropriate.
* Sitemaps (HTML and XML)
* Nick anything good from http://localhost:4000/single-post.html
* Consider a portfolio like http://localhost:4000/portfolio.html, http://www.blacktie.co/demo/solid/single-project.html
* Finalise main nagivation and sections.
* Finalise front-page content.
* Create a better, dynamically created site map.

Other ideas

* I like the notion of auto-generating images for blog posts based on the content, perhaps via https://code.google.com/p/jspos/ or similar.

Notes
-----

* Hard to maintain because
    * Security
    * Themes
    * Time
* Some issues in the original Drupal site are hard to work around, and arise due to poor migrations between Drupal versions. Especially:
    * The image module, older images borken.
    * PHPWiki markup (not supported in D7?)
    * [image:] image_filter usage.
    * web links not upgraded.
* Scanned through all tables to check for my data versus system data.
