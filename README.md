anjackson.github.io
===================

This repository holds my efforts to convert my long-running Drupal site into a more maintainable static version.

Use 

    $ jekyll serve --watch --drafts --config _config.yml,_config-minimal.yml

while tweaking to minimise the number of pages included, and so keep the rebuilds fast.

To Do
-----

Before going live:

* Update /work/ section, as appropriate.
* Sitemaps (HTML and XML) and feed(s).

Later:

* Add a 'legacy' section that includes:
    * /book/
    * /img-n/
    * /weblinks/
    * /imported-sitemap/
    * /geek/
* Document the migration and the broken URLs
    * Books http://anjackson.net/book/, e.g. http://anjackson.net/work/digitalpreservation book structure, and http://anjackson.net/book/export/html/1836
    * http://anjackson.net/topic/digital_preservation
    * http://anjackson.net/image/

### Projects to add ###

* OpenWayback?

* SCAPE
* Planets
* Archiving the UK Web (NPLD)
* Strender
* Migration Workflow (EAP)
* Formats over Time
* Discovery for web archives (overarching)?
* AQuA etc.

* MCMC?
* QCDgrid
* JP2 profile? PDF risks? JHOVE analysis?
* MSc Module Coordinator: Applied Numerical Algorithms
* QCDOC
* EGEE Network Performance Diagnostic Tool
* Lattice Switch MC


Other ideas

* I like the notion of auto-generating images for blog posts based on the content, perhaps via https://code.google.com/p/jspos/ or similar.
* I also like the idea of a digital preservatio RSS aggregator subsite based on Jekyll, if possible.

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
