// HMIN H-minima transform.
// suppresses all minima in I whose depth is less than
//   H.  I is an intensity image and H is a nonnegative number.
// This is the same a "preflood", but different than "impose minimum"

// G. Landini 10 May 2009
h= getNumber("H", 40);
setBatchMode(true);
a=getTitle();
selectWindow(a);
run("Invert");
run("Duplicate...", "title=_b");
selectWindow("_b");
run("Subtract...", "value="+h);
run("GreyscaleReconstruct ", "mask=["+a+"] seed=_b create");
selectWindow(a);
run("Invert");
selectWindow("Reconstructed");
rename("hmin");
run("Invert");
setBatchMode(false);
