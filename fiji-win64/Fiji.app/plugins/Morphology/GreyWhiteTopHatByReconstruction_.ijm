// GreyWhiteTopHatByReconstruction
// G. Landini at bham. ac. uk.
// 1/Oct/2010
setBatchMode(true);
a=getTitle();
run("Duplicate...", "title=_seed");
run("Minimum...", "radius=2");
run("GreyscaleReconstruct ", "mask=["+a+"] seed=_seed");
imageCalculator("Subtract create", a,"_seed");
selectWindow("Result of "+a);
rename("WhiteTopHatReconstructed");
setBatchMode(false);
