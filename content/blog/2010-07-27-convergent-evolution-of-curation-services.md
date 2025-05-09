---
layout: post
type: blog
promote: 1
status: 1
created_ts: 1280256710
changed_ts: 1280263305
node_id: 1872
title: convergent evolution of curation services
author: anj
created: '2010-07-27'
changed: '2010-07-27'
category:
tags: ["Development", "Digital Preservation"]
url: "/2010/07/27/convergent_evolution_curation_services/"
aliases:
  - "/node/1872/"
date: '2010-07-27'
---
I don't know if it was coincidence, or by design, but [the latest issue](http://www.ijdc.net/index.php/ijdc/issue/view/11) of the [International Journal of Digital Curation](http://www.ijdc.net/index.php/ijdc) contains two very similar articles. One is from the [Planets Project](http://www.planets-project.eu), is co-authored by me, and is called [A Framework for Distributed Preservation Workflows](http://www.ijdc.net/index.php/ijdc/article/view/157). The other is called [An Emergent Micro-Services Approach to Digital Curation Infrastructure](http://www.ijdc.net/index.php/ijdc/article/view/154), and is by Stephen Abrams et al from [CDL](http://www.cdlib.org/services/uc3/curation/). These two separate papers describe two approaches to building preservation systems, which despite having been developed independently appear to be converging towards a single, consistent design.
<!--break-->
Both approaches are based around building atomic service interfaces for different classes of operations that can be performed on digital objects. For example, the Identification service that takes a digital object and attempts to determine the format. Different tools can be encapsulated in order to provide these services, and as they all conform to the same interface, they can be swapped around easily. Strong service definitions also allow the development of the tools and services to be de-coupled from the way they are employed. Higher-level workflow systems or other interfaces can invoke a wide range of tools without any modification, and despite their apparent simplicity, very complex workflows can be built out of these re-usable, atomic chunks.

The main difference between the two approaches is scope. The UC3 system is a complete set of micro-services for managing a digital repository. The [Planets Suite](http://sourceforge.net/projects/planets-suite/) provides a service-oriented framework for 'preservation services', i.e. for only a sub-set of the full range of functionality a repository may require. The current version of the Planets services definitions can be found [here](http://planets-suite.sourceforge.net/javadoc/), although I should warn you that some of them are more mature than others, and it is not easy to tell which by looking at the code! 

The following definitions are particularly notable in this context:

* [Identify](http://planets-suite.sourceforge.net/javadoc/eu/planets_project/services/identify/Identify.html)
* [Characterise](http://planets-suite.sourceforge.net/javadoc/eu/planets_project/services/characterise/Characterise.html)
* [Validate](http://planets-suite.sourceforge.net/javadoc/eu/planets_project/services/validate/Validate.html)
* [Fixity](http://planets-suite.sourceforge.net/javadoc/eu/planets_project/services/fixity/Fixity.html)
* [Migrate](http://planets-suite.sourceforge.net/javadoc/eu/planets_project/services/migrate/Migrate.html) (which should really have been called Transform to be consistent with OAIS - sorry about that!)

Of these, Identify, Fixity and Migrate appear to map quite precisely to the Identify, Fixity and Transformation micro-services in the UC3 approach. The Characterise mapping is somewhat different. In the U3C scheme JHOVE provides both of these operations as a single Characterize service, whereas in Planets we chose to separate them out because although the underlying code may be essentially the same (deep characterisation has to understand the format!), the form of the responses are very different. When Characterising, we wish to extract the properties of the object. When Validating, we want to know the level of conformance and the nature of any exceptions. By separating these two operations, we were able to standardise how all of the components expressed digital object properties, and keep that part of the design separate from the more immature Validate service definition, which is still not really production-ready.

The UC3 approach contains a lot more detail about storage, indexing, retrieval and so on. In the Planets approach, the complexity of managing the 'physical' preservation of the digital objects is hidden behind a single DigitalObjectManager interface, which is trusted to store and retrieve the items reliably. I suspect the UC3 approach is stronger here, but our simple design met the scope of our requirements, and provides a convenient abstraction behind which a range of different storage systems can be masked. For example, we have storage adapters for plain file systems, file systems with extended metadata, Fedora Commons, OAI-PMH and others, including the custom storage platforms of a number of the partner institutions. Certainly, the trusted storage systems used by large institutions tend to change very slowly, so having a entirely separate architecture for managing actions upon a generic bit-store may perhaps turn out to be the best approach in that context.

Just like the services themselves, wrapping a storage system to be compatible with the Planets infrastructure is a case of implementing a single Java interface. The main difference is that as our security model is rather immature, the storage interface is not exposed as a web service, but rather can only be invoked from the workflow layer. I'm not sure how the UC3 approach deals with this issue. Perhaps all code is running 'locally' (on the local network) and so can be trusted to some degree, or perhaps there is some authentication and authorisation system in place. OAuth is potentially quite a good fit here, and that is something we might look into for future Planets work.

Aside from this, there are further differences in the approaches, but they are relatively minor. Planets offers a [CreateView](http://planets-suite.sourceforge.net/javadoc/eu/planets_project/services/view/CreateView.html) service that allows emulation systems to be embedded into the workflows. UC3 uses RESTful services, whereas Planets uses rather heavyweight JAX-WS service interfaces. Personally, I strongly suspect that Planets will shift to a RESTful architecture before too long, and I also suspect that the [validate interface](http://code.w3.org/unicorn/wiki/Documentation/Observer) provided by the [W3C Unicorn](http://code.w3.org/unicorn/) project may well be part of that redesign.

This may sound like a major and disruptive change, but for Planets changing from web service to RESTful services will be little more than switching the JAX-WS annotations for some JAX-RS ones. The important thing is that we have agreed the service interfaces, and this allows the same implementations to be applied in a wide range of circumstances, whether it's as a local library call, a JAX-WS/RS service, or as a part of a Hadoop map-reduce job. Indeed, this last point is one of the things the proposed follow-on project to Planets will look at, if the funding is secured.

The flexibility of the approach, and our successes so far, make me feel confident that these different systems can be made to work together to the benefit of all. Indeed, there may be so much common ground that we can design our service interfaces together. However, we do not have to agree to use the same interfaces in order to reap the benefits of combining our approaches. For example, perhaps we could build a JHOVE module that pulls in Planets Characterisation and Validation services. Or write a command-line client that provide the U3C transformation service via a call to a Planets Migrate endpoint. Or write a DigitalObjectManager for the UC3 store. Or use a common service discovery method. Or help build the UDFR. And so on...

We are very keen to get feedback on our ideas and our code, and want to encourage the community to work more closely together.  To this end, as the Planets project winds down, we have made the [Planets Suite](http://planets-suite.sourceforge.net/) available to all parties via SourceForge, including a [Planets Contrib](http://planets-suite.sourceforge.net/contrib/) area for more experimental work. The [Open Planets Foundation](http://www.openplanetsfoundation.org/) have taken over the stewardship of the code, and are committed to ensuring a bright future for the ideas and products developed by Planets. Bringing together the digital preservation/curation technical community is a critical part of this. I hope you like what we've done so far, but we need you with us to get it right.

Anj
