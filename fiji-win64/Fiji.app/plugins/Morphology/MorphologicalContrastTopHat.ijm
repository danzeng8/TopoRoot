// Morphological contrast top hat
// via top hat and well transforms
// G. Landini at bham. ac. uk  7 Spe 2010
// See: P. Soille (2004) Morphological Image Analysis, p 126

setBatchMode(true);
ori=getTitle();
run("Duplicate...", "title=TopHat");
run("Duplicate...", "title=Close");
run("Duplicate...", "title=Open");
a = getNumber("Spot radius:", 1);

run("Minimum...", "radius="+a);
run("Maximum...", "radius="+a);

run("Image Calculator...", "image1=TopHat operation=Subtract image2=Open ");
selectWindow("Open");
run("Close");
//selectWindow("TopHat");
//run("Close");
//selectWindow("Result of TopHat");
selectWindow("Close");
run("Maximum...", "radius="+a);
run("Minimum...", "radius="+a);
run("Image Calculator...", "image1=Close operation=Subtract image2=["+ori+"] create");
imageCalculator("Add", "TopHat",ori);
imageCalculator("Subtract", "TopHat","Result of Close");
selectWindow("TopHat");
rename("Contrasted");
setBatchMode(false);
