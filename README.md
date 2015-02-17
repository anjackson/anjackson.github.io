anjackson.github.io
===================

This repository holds my efforts to convert my long-running Drupal site into a more maintainable static version.

Use 

    $ jekyll serve --watch --drafts --config _config.yml,_config-minimal.yml

while tweaking to minimise the number of pages included, and so keep the rebuilds fast.

To Do
-----

* Finalise import:
    * Retain additional fields from e.g. weblink.url, event.start?, quote.author, projects (no data)?
    * comments? Nah.
    * blocks? Not terribly exciting, but the Flick ones are ok.
    * aggregator? Nah.
    * events (appear to hook dates and locations together? World trip probably.)
    * taxonomyextra?
    * freelinking has a few links in it. 
    * quotes & quotes.author?
* Add a 'legacy' section that includes:
    * /book/
    * /img-n/
    * /weblinks/
    * /imported-sitemap/
    * /geek/
* Add a /blog/categories/ page.
* Update /work/ section, as appropriate.
* Sitemaps (HTML and XML)
* Nick anything good from http://localhost:4000/single-post.html
* Consider a portfolio like http://localhost:4000/portfolio.html, http://www.blacktie.co/demo/solid/single-project.html
* Finalise main nagivation and sections.
* Finalise front-page content.
* Create a better, dynamically created site map.

New structure:

* /
* /work/data-mining
* /work/digital-preservation
* /work/development

Projects to add

* Searching Web Archives
* Data-mining Web Archives?
* Datasets from Web Archives?

* OpenWayback

* SCAPE
* Planets
* Archiving the UK Web (NPLD)
* Strender
* Migration Workflow (EAP)
* Formats over Time
* AQuA etc.

* MCSiMPI
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
