---
layout: default
type: page
promote: 0
status: 1
created_ts: 1084353777
changed_ts: 1100132397
node_id: 589
title: parseDouble
author: anj
created: '2004-05-12'
changed: '2004-11-11'
redirect_from:
- "/node/589/"
permalink: "/poot/java/parseDouble/"
tags: []
---
### Converting Strings to Floating-Point Numbers in Java
I wrote this some time ago, when I was using Java 1.0 and 1.1.  Those early versions had no library routines for loading Double/Float values from a String, so I rolled my own (see below).  <!--break--> Since Java 1.2 however, all you have to do is
<code>
    try {
      double a = Double.parseDouble("1.5311243e-23").doubleValue();
    } catch( NumberFormatException e ) {
      panic(e);
    }
</code>
I'm not sure whether the parseDouble method copes with using a 'D' as the seperator between the mantissa and exponent, but I suspect it does.  Check the Java API for more info.

## Parsing Floating-Point Numbers in Java 1.0 and 1.1
While Java does have methods such as Integer.parseInt(<string>), for converting strings into integers, there doesn't appear to be any built-in methods to convert a string to a floating point number (or perhaps I just haven't found them). While writing a routine to do it is not that difficult, it is rather fiddly, and so I have included my code on these pages (see below).  The output of the program looks like this:
<code>
    Routine to show parseDouble in action...
    Should correctly interpret inputstr =  -.4322e+02 
    value = -43.22
    2*value = -86.44
</code>
The routine will translate strings of the form <mantissa> (e.g. 123.02, 121, -.321), and of the form <mantissa><exponent> (e.g. 0.123e4, 121.23d-5, .2D-001, 12E04).

Please feel free to copy and use the parseDouble routine, and If anyone knows a better way of doing it, e-mail me about it so I can improve my code. One known problem is that if the routine is made to translate a string it doesn't recognise, it just writes 'Bad data!' to the standard output and returns (double) 0.0. Whenever I get around to seriously using this routine, I'll alter it so it throws a NumberFormatException if there is a problem. 

# The Code
Included here verbatim, and can also be downloaded from the link below.
<code>
    // --> parseDoubleEG.java
    // Example stand-alone application which uses the parseDouble routine:
    // By A N Jackson.
    
    import java.io.*;
    
    class parseDoubleEG {
    public static void main(String args[]) {
      String filename,inputstr;
      float indat;
    
      inputstr = " -.4322e+02 ";
    
      System.out.println("Routine to show parseDouble in action...");
      System.out.println("Should correctly interpret inputstr = " + inputstr);
    
      indat = (float) parseDouble(inputstr);
      System.out.println("value = " + indat);
    
      indat *= 2.0;
      System.out.println("2*value = " + indat);
    
    }
    
    /* --> parseDouble v1.0
     Routine to parse a floating point number from a string.
     Written by A N Jackson (c) 27th January 1998.
    */
    public static double parseDouble(String ipstr) {
      double num = 0.0, mant = 0.0, exp = 0.0;
      int mantsn = 1,expsn = 1,dp = -1,i,len,inum = 0;
      boolean inmant = true,inexp = false, skip = false;
      char ichr;
      String istr;
    
      len = ipstr.length();
    
      for (i=0; i<len; i++) {
        skip = false;
        ichr = ipstr.charAt(i);
    
        if (inexp) {
          if (ichr == ' ') {
            skip = true;
          }
          if (ichr == '+') {
            skip = true;
          }
          if (ichr == '-') {
            expsn = -1;
            skip = true;
          }
        }
        if (inmant) {
          if (ichr == ' ') {
            skip = true;
          }
          if (ichr == '+') {
            skip = true;
          }
          if (ichr == '-') {
            mantsn = -1;
            skip = true;
          }
          if (ichr == '.') {
            dp = 0;
            skip = true;
          }
          if (ichr == 'E' || ichr == 'e' || ichr == 'D' || ichr == 'd') {
            inmant = false;
            inexp = true;
            skip = true;
          }
        }
        if (skip != true) {
          istr = "x";
          istr = istr.replace('x',ichr);
          try {
            inum = Integer.parseInt(istr);
          } catch (NumberFormatException NFE) {
            // Should throw an appropriate NumberFormatException
            System.out.println("Bad data!");
            return (double) 0.0;
          }
    
          if (inmant && dp>-1) dp++;
          if (inmant) mant = mant*10.0 + inum;
          if (inexp) exp = exp*10.0 + inum;
        }
    
      }
    
      if (dp==-1) dp = 0;
      num = mantsn*mant*Math.pow(10.0, expsn*exp - dp);
      return num;
    }
    }
</code>
