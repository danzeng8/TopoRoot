// GreyBlackTopHatByReconstruction
// G. Landini at bham. ac. uk.
// 1/Oct/2010
setBatchMode(true);
a=getTitle();
run("Duplicate...", "title=_seed");
run("Maximum...", "radius=2");
run("Invert");
selectWindow(a);
run("Invert");
run("GreyscaleReconstruct ", "mask="+a+" seed=_seed create");
selectWindow(a);
run("Invert");
selectWindow("Reconstructed");
run("Invert");
rename("BlackTopHatReconstructed");
imageCalculator("Subtract", "BlackTopHatReconstructed",a);
setBatchMode(false);
