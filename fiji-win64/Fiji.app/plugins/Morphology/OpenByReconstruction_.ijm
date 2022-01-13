// OpenByReconstruction
// G. Landini at bham. ac. uk.
// 1/Oct/2010

setBatchMode(true);
a=getTitle();
radius=getNumber("Radius", 4);
run("Duplicate...", "title=_seed");
run("Minimum...", "radius="+radius);
run("GreyscaleReconstruct ", "mask=["+a+"] seed=_seed create");
selectWindow("Reconstructed");
rename("OpenReconstructed");
setBatchMode(false);
