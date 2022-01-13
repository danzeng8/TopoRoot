//Extended_Minima
// The extended-maxima transform, is the regional maxima 
// of the H-maxima transform.  H is a nonnegative number.
// G. Landini 10 May 2009
run("HMaxima Transform");
selectWindow("hmax");
run("Regional Maxima");
selectImage("hmax");
rename("extendedmax");
