---
layout: default
type: page
promote: 0
status: 1
created_ts: 1081217625
changed_ts: 1081248825
node_id: 528
title: Extended Precision Problem.
created: '2004-04-06'
changed: '2004-04-06'
redirect_from:
- "/node/528/"
permalink: "/title/FPExtendedPrecisionProblem/"
tags: []
---
## Introduction
The simulation that hit this problem involved random-walking hard spheres until they _just_ touch - i.e. the output of a FP computation (determining the distance between two points) was being compared to the required separation (`2r`) at various stages of the code.

## Examples
Comparing double precision numbers that may be exactly equal (and in this case where they _should_ be <tt>==</tt>) is always a bit hairy, and to be avoided.  The code I inherited relied on such a comparison always being consistent, which need not be the case.  A simple example would be (in C):

  int main()
  {
    double          x=sqrt(2.0);
    volatile double y=x;
    if (x!=y) printf("Uh oh!\n");
    return 0;
  }

One would assume that this should never print 'Uh oh!', but when compiled with optimization under gcc for x86 [1] it can indeed find that <tt>x!=y</tt>. Similar problems can arise with code of the form:

  if( (y=_{something-nasty-mathsy-expression}_) > x ) {
    // Do something fab...
    _{something fab}_
    // Check consistency:
    assert( y > x );
  }

The assert line can fail, even though the if construct would seem to assure that <tt>y</tt> is always greater than <tt>x</tt> here.  As before, the failure only tends to happen under optimization.

## Explanation
The issue is that under optimization, more floating point numbers are stored in registers more frequently (or rather, stored to memory _less'' frequently as storing things is slow), and the registers on these chips actually store floating point numbers using, say, 80 bits ('extended precision') instead of 64 bits.  If the numbers are rounded at every stage (e.g. by being stored to memory) then no inconsistencies arise, but if not, as is more common for optimized code, then FP variables utilised at different stages of the code may differ due to this variable degree of rounding.  In the above assertion example, the first comparison happens on chip just after <tt>y</tt> is computed, at extended precision, and determines <tt>y</tt> to be greater than <tt>x</tt>.  Later on, after both variables have been rounded to 64 bits via a store-to-memory operation, <tt>x</tt> is no longer greater than <tt>y</tt> because at this level of precision <tt>x</tt> is in fact ''equal to_ <tt>y</tt>.

This also explains another thing I hit with this code: that by adding a subroutine call (e.g. <tt>printf("")</tt>) in certain places in such codes the unexpected behaviour can be stopped.  A function call forces all variables to be stored to memory (or at least onto the stack), unless the function is inlined.

## Fix
As noted in the references below, there may always be some residual problems due to this kind of extended precision issue.  However, under gcc on x86, you can get rid of a lot of them by using the __-ffloat-store__ compiler flag (if I remember correctly, it only works when placed after the __-O__ option, but this contradicts the manual and so I may be wrong about that).  I have only observed this problem under gcc C/C++, it did not happen under Portland Group's pgcc/pgCC and I have no idea if it can happen under other languages or compilers.  For what it's worth, I suspect it does not happen when using FORTRAN - the standard is probably rather specific on this issue.

The residual problems mentioned above arise in the temporaries used during evaluation - in short, everything you assign, e.g. the <tt>x</tt> in 
  x = _{something-mathsy}_
will be rounded consistently, but the temporaries used in <tt>_{something-mathsy}_</tt> will often be evaluated under extended precision.  For many simulation purposes this is fine (and frequently desirable), but for the purposes of the purest forms of numerical analysis (where one is concerned with creating exactly reproducible algorithms dependent on e.g. IEEE arithmetic and independent of compiler-specific and processor-specific issues) it may be troublesome.

However, for me, the _real'' problem was that the code I was working with was designed to use floating point numbers when the entire thing could have been done using integer arithmetic.  The spheres are made to random-walk on a ''lattice'', and the discrete nature of this problem makes an integer algorithm possible and indeed preferable.  Using floats under these conditions give the algorithm more freedom than it requires, and provides just enough rope for it to hang itself.  Alternatively, if one insists on using floats, even just comparing the ''squares'' of the seperation between points (instead of taking the square root) would have led to a more stable algorithm, as the kind of numbers the code was dealing with would then ''never'' have been rounded ''at all_.

##  Notes
[1]The level of optimization required to observe this behaviour depends on the particular version of gcc being used.

## References
* <a href="http://gcc.gnu.org/ml/gcc/2003-08/msg01183.html">Floating point trouble with x86's extended precision</a> and the related <a href="http://gcc.gnu.org/ml/gcc/2003-08/threads.html#01230">discussion</a> on the gcc@gcc.gnu.org mailing list.
* <a href="http://www.litho.ucalgary.ca/opt/SPRO/common/ug/goldberg1.doc.html#3377">Pitfalls in Computations on Extended-Based Systems</a>, part of the rather useful <a href="http://www.litho.ucalgary.ca/opt/SPRO/common/ug/index.html">Numerical Computation Guide</a> from Sun.
