anjackson.github.io
===================

This repository holds my efforts to convert my long-running Drupal site into a more maintainable static version.

To Do
-----

* Finalise import:
    * Retain Book structure and additional fields?
    * Menus? Needed for book structure I think. Uses menu_links although book module ties menu link IDs to book and node ids.
    * Retain additional fields from e.g. weblink.url, event.start?, quote.author, projects (no data)?
    * Check pages and stories for additional fields?
    * To retain the hierarchy, (somehow) pull the parent relationships in from taxonomy_term_heirarchy.
    * comments?
* Get attachments working properly.
* Nick anything good from http://localhost:4000/single-post.html
* Consider a portfolio like http://localhost:4000/portfolio.html, http://www.blacktie.co/demo/solid/single-project.html
* Add side-bar to images?
* Add a /blog/categories/ page.
* Add 'missing' (i.e. DB-generated) pages:
    * /books/?
* Update /work/ section, as appropriate.
* Sitemaps (HTML and XML)
* Finalise main nagivation and sections.
* Finalise front-page content.
* Create a better, dynamically created site map.

Notes
-----

* Hard to maintain because
    * Security
    * Themes
    * Time
* Some issues in the original Drupal site are hard to work around, and arise due to poor migrations between Drupal versions. Especially:
    * The image module.
    * PHPWiki markup.
    * [image:] image_filter support.
