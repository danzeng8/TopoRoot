// CloseByReconstruction
// G. Landini at bham. ac. uk.
// 1/Oct/2010
setBatchMode(true);
a=getTitle();
radius=getNumber("Radius", 4);
run("Duplicate...", "title=_seed");
run("Maximum...", "radius="+radius);
run("Invert");
selectWindow(a);
run("Invert");
run("GreyscaleReconstruct ", "mask=["+a+"] seed=_seed create");
selectWindow(a);
run("Invert");
selectWindow("Reconstructed");
run("Invert");
rename("ClosedReconstructed");
setBatchMode(false);
