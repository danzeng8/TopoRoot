//Extended_Minima
// The extended-minima transform, is the regional minima 
// of the H-minima transform.  H is a nonnegative number.
// G. Landini 10 May 2009
run("HMinima Transform");
selectWindow("hmin");
run("Regional Minima");
selectImage("hmin");
rename("extendedmin");
