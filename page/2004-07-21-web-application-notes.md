---
layout: post
title: Web Application Notes
created: 1090420320
permalink: "/2004/07/21/web_application_notes/"
---
A place for various notes discovered while making web applications.
<!--break-->

!!!Java Servlets
Most if not all web apps I write are in Java, and usually use Tomcat (although Jetty is handy when memory is tight).

!!Jakarta Tomcat

!Java Flags
I use these before starting Tomcat. The latter of these lines enures that the server does not require an X-server to do graphics related type things.

  export JAVA_HOME="/opt/local/j2sdk1.4.0"
  export CATALINA_OPTS="-Djava.awt.headless=true"

However, some things will throw a HeadlessException when you try to run them in this context.  Usually this means you're trying to do the wrong thing, but sometimes you may depends on another's code that was not designed to run in a server context, even though it is an entirely legitimate use of the code.  In this case, you can set up a virtual frame buffer, a non-existance screen that the server can connect to.  Here's the invocation...

  export CATALINA_OPTS=""
  Xvfb :1 -screen 0 800x600x8 &
  export DISPLAY=:1

Now, when you run Tomcat, it will connect to this virtual screen and not grumble.

!Servlet Mappings
Older versions of Tomcat automatically took classes in the default package of a web application (./WEB-INF/classes/*.class) and presented them as servlets at context-path/servlets/*.  Later versions appear to have this behaviour switched off (commented out of conf/web.xml) by default.  The servlet-mapping should be placed in your applications web.xml if you need it.
    &lt;!-- The mapping for the invoker servlet -->
    &lt;servlet-mapping>
        &lt;servlet-name>invoker&lt;/servlet-name>
        &lt;url-pattern>/servlet/*&lt;/url-pattern>
    &lt;/servlet-mapping>

!Jakarta Tomcat & Apache
This page outlines my experiences of getting Apache and Tomcat to work together smoothly, starting from a 'blank slate' RH8 Linux machine (hosted by one&one).

!!Software Packages
*Java 1.4.0 (preinstalled).
*Tomcat 4.0 (preinstalled).
*Apache 1 (preinstalled).
**Including mod_jk (preinstalled).

!!Configuration
Enable the AJP-1.3 Connector on Tomcat.  Leave an 8080 HTTP port open at first and test that everything works - then shut the 8080 port down leaving only the AJP open.

Edit http.conf with magik like this (which allows the examples to be accessed via Apache):
 &lt;IfModule mod_jk.c>
  JkWorkersFile /etc/httpd/conf/workers.properties
  JkLogFile    /var/log/httpd/mod_jk.log
  JkLogLevel   warn
 &lt;/IfModule>

  Alias /examples /var/tomcat/webapps/examples
  &lt;Directory "/var/tomcat/webapps/examples">
    Options Indexes FollowSymLinks
  &lt;/Directory>
  &lt;Location "/examples/WEB-INF/">
    AllowOverride None
    deny from all
 &lt;/Location>
 JkMount /exmaples/servlet/* ajp13
 JkMount /examples/* ajp13
 JkMount /servlet/* ajp13
 JkMount /*.jsp ajp13

!!! Setting up Apache
!! Briefly...
This is a summary of the stages I went through when compiling up a suitable version of Apache (2.0.50) for the EPCC website etc.  I have not in cluded details of where I downloaded the source distributions from as that is by far the easiest bit!  Just [http://www.google.com Google]!

!! Compiling Apache
  nsu apache
  cd ~/apache2/
  gtar xvfz httpd-2.0.50.tar.gz
  cd httpd-2.0.50
  ./configure --prefix=/opt/local/packages/apache_2.0.50 --enable-ssl --enable-cgi --enable-suexec \
  --enable-rewrite --enable-deflate --enable-headers
  ./configure --prefix=/opt/local/packages/apache_2.0.50 --enable-ssl --enable-cgi --enable-suexec \
  --enable-rewrite --enable-deflate --enable-headers
  gmake
  gmake install

!! Compiling Extra Modules For Apache 
As well as the standard Apache 2 modules, we need PHP and the JK2 connector to run Tomcat behind Apache.  This is how I compiled the required modules.

!! PHP and it's dependancies
For our PHP install we need the GD graphics library, which in turn requires the FreeType font library, so we compile and install each of these under apache_2.0.50 in turn.

  mkdir /opt/local/packages/apache_2.0.50/modules_build

! The FreeType Library
Freetype configure needs a GNU-compatible {{egrep}} and so had to be run an a machine other than amethyst as the GNU Utils cannot be found there.  I used {{garnet}}

  cd ~/apache2/
  gtar xvfz freetype-2.1.9.tar.gz
  cd freetype-2.1.9
  GNUMAKE=`which gmake` ./configure --prefix=/opt/local/packages/apache_2.0.50/modules_build/freetype-2.1.9 --without-zlib
  gmake
  gmake install

There was some linking problem with the general zlib library, so I had to use the --without-zlib flag to get the package to use it's own internal zlib.

! The GD Graphics Library
Back on {{amethyst}}.

  cd ~/apache2/
  gtar xvfz gd-2.0.28.tar.gz
  cd gd-2.0.28
  ./configure --prefix=/opt/local/packages/apache_2.0.50/modules_build/gd-2.0.28 --enable-shared --enable-static \
  --with-freetype=/opt/local/packages/apache_2.0.50/modules_build/freetype-2.1.9
  gmake
  gmake install

! Compiling the PHP module

  ./configure --prefix=/opt/local/packages/apache_2.0.50/modules_build/php-4.3.8 --with-apxs2=/opt/local/packages/apache_2.0.50/bin/apxs \
  --with-mysql --with-gd=/opt/local/packages/apache_2.0.50/modules_build/gd-2.0.28 --with-java=/usr/j2se \
  --with-freetype-dir=/opt/local/packages/apache_2.0.50/modules_build/freetype-2.1.9

At the end of the configure I got this warning:

  | You chose to compile PHP with the built-in MySQL support.  If you |
  | are compiling a server module, and intend to use other server     |
  | modules that also use MySQL (e.g, mod_auth_mysql, PHP 3.0,        |
  | mod_perl) you must NOT rely on PHP's built-in MySQL support, and  |
  | instead build it with your local MySQL support files, by adding   |
  | --with-mysql=/path/to/mysql to your configure line.               |

Which should not be an issue, but is placed here in case it becomes an issue in the future.  The reason I did not do what it suggests is that I could not access the path to mysql as this was only visible to the mysql user (or perhaps I missed the public install location???).

  gmake

Yawn.  Go get a cuppa.

  gmake install

This stage drops libphp4.so into place in apache_2.0.50/modules - no further configuration is required.

! Configuring Apache for PHP
Add these lines to httpd.conf - see the production one for more details.

  LoadModule php4_module        modules/libphp4.so
  ...
  AddType application/x-httpd-php .php
  AddType application/x-httpd-php-source .phps

!! The Java Server Connector (JK2) Module
This will allow us to connect a Tomcat server to Apache.  http://jakarta.apache.org/ for more info.

  cd ~/apache2/
  gtar xvfz jakarta-tomcat-connectors-jk2-current-src.tar.gz
  cd jakarta-tomcat-connectors-jk2-2.0.4-src/jk/native2/
  ./configure --with-java-home=/usr/j2se --with-apxs2=/opt/local/packages/apache_2.0.50/bin/apxs --with-java-platform=2 --enable-jni
  gmake
  cd ../build/jk2/apache2/
  /opt/local/packages/apache_2.0.50/bin/apxs -n jk2 -i mod_jk2.so

! Configuring Apache for the JK module
I added this to httpd.conf:

  LoadModule jk2_module modules/mod_jk2.so

And also added this file {{apache_2.0.50/conf/workers2.properties}} 

  [[channel.socket:localhost:11809]
  port=11809
  host=127.0.0.1
  
  [[ajp13:localhost:11809]
  channel=channel.socket:localhost:11809
  
  [[uri:/examples/*]
  worker=ajp13:localhost:11809

!!! Tomcat
I unpacked the latest 4.1.x distribution of Tomcat into {{/opt/local/packages/jakarta-tomcat-4.1.30/}}.  The main configuration actions are to switch off everything but the AJP (JK2) connector in server.xml (i.e. switching off the 8080 HTTP and any other connectors) and to configure it to use non-standard ports to avoid port clashes.  I used 11809 for the AJP connector and 11805 for the shutdown port.

!!! General Apache Configuration
This is mainly a case of chugging through the old httpd.conf for the external website and adding all the info into the relavent places in a copy of the http.conf in the newer version of Apache.  And then doing the same thing all over again for the internal website.

!! SSL
I set up a self-signed certificate so that we can run the SAF for ACF over SSL.  I took the commands from here: http://www.tldp.org/HOWTO/SSL-RedHat-HOWTO-3.html and then hacked ssl.conf as required.  The short version is:

  mkdir conf/ssl.key
  cd conf/ssl.key
  openssl genrsa -des3 -rand ~/AdobeFnt.lst -out server.key 1024

I chose a passphrase.

  mkdir ../ssl.crt
  cd ../ssl.crt

I created {{openssl.ca.cnf}} which looks like this:

  # 
  # SSLeay example configuration file. 
  # This is mostly being used for generation of certificate requests. 
  # 
  
  RANDFILE                = ./.rnd
  
  ####################################################################
  [[ req ]
  default_bits            = 512
  default_keyfile         = server.key
  distinguished_name      = req_distinguished_name
  encrypt_rsa_key         = no
  default_md              = sha1
  
  [[ req_distinguished_name ]
  countryName                     = Country Name (2 letter code)
  countryName_default             = AU
  countryName_value               = UK
  
  organizationName                = Organization Name (eg, company)
  organizationName_value          = EPCC
  
  commonName                      = Common Name (eg, YOUR name)
  commonName_value                = EPCC CA

Last bit, CN, should be the server name, e.g. www.epcc.ed.ac.uk.
And then did this:

  openssl req -config openssl.ca.cnf -new -key ../ssl.key/server.key -x509 -out server.crt

Now we have a self-signed certificate.  All that remains is to ensure we define 'SSL' when we start Apache.

!! Deployment
When in testing we can kick things off with a:

  cd /opt/local/packages/apache_2.0.50
  ./bin/apachectl -D SSL -D DUMP_VHOSTS -k start

I changed the default port to 1180 for this as I only root can access low ports.  This should be changed back to 80 for production.  

!!References
*[Jakarta Tomcat JK1.2 AP HowTo|http://jakarta.apache.org/builds/jakarta-tomcat-connectors/jk/release/v1.2.0/doc/jk/aphowto.html]
*[Jetty:// Web Server & Servlet Container|http://jetty.mortbay.org/jetty/index.html]
*[JSOAP|http://soap.fmui.de/index.php]

!!!Web Services
Are kinda groovy.

!!Links
*'''Directories'''
**[xmethods.net|http://www.xmethods.net/]
**[bindingpoint.net|http://www.bindingpoint.com/]
*'''Providers'''
**Commerce: [Amazon|http://www.amazon.com/webservices]
**Geolocation: [MapPoint|http://www.microsoft.com/mappoint/net/]
**Geolocation: Giffle:MapQuest (currently more global than MapPoint, but do they actually provide web services?)
**Translation: [Lingua|http://contest.eraserver.net/Lingua/service/Translator.asmx] unitary key
**Search: [Google|http://www.google.com] has a Web Service API, and a translator?
**SMS: e.g. [Lucin|http://www.soapengine.com/lucin/soapenginex/smsx.asmx].

!!Costs
A half-penny per query seems to be the going rate for a cost-per-transaction web service.

