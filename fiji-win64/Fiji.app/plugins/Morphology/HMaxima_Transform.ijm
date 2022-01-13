// HMAX H-maxima transform.
// suppresses all maxima in I whose height is less than 
//  H.  I is an intensity image and H is a nonnegative number.
// G. Landini 10 May 2009
h= getNumber("H", 40);
setBatchMode(true);
a=getTitle();
selectWindow(a);
run("Duplicate...", "title=_b");
selectWindow("_b");
run("Subtract...", "value="+h);
run("GreyscaleReconstruct ", "mask=["+a+"] seed=_b create");
selectWindow("Reconstructed");
rename("hmax");
setBatchMode(false);
