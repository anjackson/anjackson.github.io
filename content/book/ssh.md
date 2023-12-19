---
layout: default
type: book
promote: 0
status: 1
created_ts: 1092129270
changed_ts: 1159004653
node_id: 984
title: ssh
author: anj
created: '2004-08-10'
changed: '2006-09-23'
redirect_from:
- "/node/984/"
permalink: "/2004/08/10/ssh/"
tags: []
---
### Ssh
Various tips when using the secure shell [ssh](http://www.openssh.com/).
<!--break-->

## sshd[[_xxx_]: Failed none for _user_ from _xxx.xxx.xxx.xxx_ port _xxxx_ ssh2 
I was having some serious problems with this error cropping up in the server logs just as a particular user logged in, just like this ([taken from here](http://www.derkeiler.com/Mailing-Lists/securityfocus/Secure_Shell/2004-12/0001.html)):

    Dec 1 03:27:28 mx sshd[743]: Failed none for mxadmin from 192.168.3.3 port 4321 ssh2
    Dec 1 03:27:37 mx sshd[743]: Accepted password for mxadmin from 192.168.3.3 port 4321 ssh2 

This was in turn causing [denyhosts](http://denyhosts.sourceforge.net/) to kick in and block the user's IP address.  I eventually discovered that the reason the client software was attempting a login without any authentication method was because the users _~/.ssh_ directory and the files within it were world readable.  A quick 
    chmod -R 700 ~/.ssh
on the user's machine fixed the problem.  Quite why OpenSSH behaves this way escapes me.

## Key-pair generation
    _andyj@garnet$ ssh-keygen -t dsa_
    Enter file in which to save the key(/home/andyj/.ssh/id_dsa): 
    Generating public/private dsa key pair.
    Enter passphrase(empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /home/andyj/.ssh/id_dsa.
    Your public key has been saved in /home/andyj/.ssh/id_dsa.pub.
    The key fingerprint is:
    md5 1024 43:71:68:a2:9d:a1:9a:62:16:53:3e:f3:4b:6d:90:57 andyj@garnet
    _andyj@garnet$_

## Filetypes

* __PKCS (Public-Key Cryptography Standards):__ A set of standards developed by RSA laboratories.
    * PKCS #1: RSA Cryptography Standard
    * PKCS #2: Note below
    * PKCS #3: Diffie-Hellman Key Agreement Standard
    * PKCS #4: Note below
    * PKCS #5: Password-Based Cryptography Standard
    * PKCS #6: Extended-Certificate Syntax Standard
    * PKCS #7: Cryptographic Message Syntax Standard
    * __PKCS #8: Private-Key Information Syntax Standard__ - A standard for the file format of private keys.
    * PKCS #9: Selected Attribute Types
    * __PKCS #10: Certification Request Syntax Standard__
    * PKCS #11: Cryptographic Token Interface Standard
    * __PKCS #12: Personal Information Exchange Syntax Standard__ - A standard for a database of certificates and private keys.
    * PKCS #13: Elliptic Curve Cryptography Standard
    * PKCS #15: Cryptographic Token Information Format Standard
* __PEM (Privacy Enhanced Mail)__
    * PEM is an IETF standard for secure e-mail. Defined in RFC 1421 through 1424. The PEM format is often used for encoding certificates and keys in ASCII. PGP is a competing protocol.
* __X.509__
    * A format for digitally signed certificates.  Quite how this standard relates to the PKCS standards is unclear to me at present.

## Generating Public/Private Keypairs
Keys usually come in pairs, with one half being the public key and the other half being the private key.  With OpenSSL, the private key contains the
public key information as well, so a public key doesn't need to be
generated separately.

Public keys come in several flavors, using different cryptographic
algorithms.  The most popular ones associated with certificates are
RSA and DSA, and this HOWTO will show how to generate each of them.

# To generate a RSA key
A RSA key can be used both for encryption and for signing.
Generating an RSA private-key certificate is quite easy, all you have to
do is the following:

    openssl genrsa -des3 -out privkey.pem 2048

With this variant, you will be prompted for a protecting password.  If
you don't want your key to be protected by a password, remove the flag
'-des3' from the command line above.

## Obtaining a Certificate
_Somehow convert the private key into a signed pub-priv certificate via the certificate authority._

## Converting user certificates to pkcs#12
To load PEM format (Globus-style) user certificates into Netscape or Internet Explorer, you first need to convert them into pkcs#12 format. This is most easily done with openssl version 0.9.3 or later.

If you have used your certificate with Globus, the conversion is most easily done on the machine with the .globus directory where your working Globus certificates are stored. (You can run grid-proxy-init to check they are installed correctly if you are in any doubt.)

That machine must have openssl installed for the following procedure to work. If you are using Redhat Linux 7.x then you have probably got openssl installed already. Typing openssl version will verify it is installed and tell you what version. (For Redhat 6.x, you can download a suitable OpenSSL RPM from <http://datagrid.in2p3.fr/distribution/external/)>

Once you have a working installation of openssl, you need to check that the certificate you have is valid for use in a web browser, by issuing the command: 
    openssl x509 -in usercert.pem -text

The output should include these lines (possibly with the SSL Server and S/MIME references absent):

    Netscape Cert Type: 
    SSL Client, SSL Server, S/MIME

If SSL Client is missing, you will need to have your certificate reissued by your certificate authority, with the additional Cert Type "SSL Client"

Once you have an SSL-Client valid certificate, generate a pkcs12 version of your certificate and key by issuing the following command (NB the .p12 file includes a copy of your private key from userkey.pem, protected by the passphrase you are prompted for. You should treat the .p12 file with the same care as your userkey.pem private key.)

    openssl pkcs12 \
    -export -in ~/.globus/usercert.pem \
           -inkey ~/.globus/userkey.pem \
           -out ~/.globus/uskycert.p12

The resulting file uskycert.p12 can then be loaded into Netscape or Internet Explorer, either on the Unix machine with your .globus directory or by copying the file to a Windows machine and loading it there.

For Netscape: Communicator | Tools | Security Info | Certificates | Yours | Import a Certificate

For Internet Explorer: Tools | Internet Options | Content | Certificates | ?Personal? | Import 

## Sources & References
* [http://www.grid-support.ac.uk/ca/]
    * [http://www.grid-support.ac.uk/ca/user-documentation/]
* [http://www.openssh.com/]
* [http://www.openssl.org/]
    * [http://www.openssl.org/docs/HOWTO/keys.txt]
    * [http://www.openssl.org/docs/HOWTO/certificates.txt]
* [http://www.mcg.org.br/cert.htm]
* [http://www.gridpp.ac.uk/authz/gridsite/guide.html]
* [http://www.cs.indiana.edu/~chiuk/security/glossary/]
* [http://www.rsasecurity.com/rsalabs/pkcs/]
* [http://www.fourmilab.ch/hotbits/]
