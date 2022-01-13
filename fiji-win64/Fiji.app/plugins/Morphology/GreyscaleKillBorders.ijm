//GreyscaleKillBorders.txt
// Removes bright greyscale objects touching the image border.
// G. Landini at bham ac uk
// 20 Sep 2010
// See P. Soille. Morphological Image Analysis (2004) p198.
setBatchMode(true);
a=getTitle();
run("Duplicate...", "title=seed");
run("Set...", "value=0");
run("Add Borders", "top right bottom left white");
imageCalculator("AND", "seed", a);
run("GreyscaleReconstruct ", "mask="+a+" seed=seed create");
imageCalculator("Subtract create", a,"Reconstructed");
setBatchMode(false);
