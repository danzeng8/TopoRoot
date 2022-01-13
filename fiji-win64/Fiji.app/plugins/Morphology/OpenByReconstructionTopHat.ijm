// OpenByReconstructionTopHat
// opening by reconstruction
// G. Landini 10 May 2009

a=getTitle();
setBatchMode(true);
run("Duplicate...", "title=openrecttophat");
run("Duplicate...", "title=openrec");
radius=getNumber("Radius", 4);

selectWindow("openrec");
run("Minimum...", "radius="+radius);
run("GreyscaleReconstruct ", "mask=openrecttophat seed=openrec");
imageCalculator("Subtract", "openrecttophat", "openrec");
selectWindow("openrecttophat");
setBatchMode(false);
