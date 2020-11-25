//GreyscaleTopHat by G. Landini at bham. ac. uk
//detects light spots on a dark background
//the complementary operation is "Well"

run("Duplicate...", "title=TopHat");
run("Duplicate...", "title=Open");
a = getNumber("Spot radius:", 1);

// for round particles
run("Minimum...", "radius="+a);
run("Maximum...", "radius="+a);

// for non-round particles this may give better results
// run("GreyscaleErode ", "iterations="+a+" white");
// run("GreyscaleDilate ", "iterations="+a+" white");

run("Image Calculator...", "image1=TopHat operation=Subtract image2=Open");
selectWindow("Open");
run("Close");
selectWindow("TopHat");
