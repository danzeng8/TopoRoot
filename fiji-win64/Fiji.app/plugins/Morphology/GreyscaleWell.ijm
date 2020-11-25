//GreyscaleWell by G. Landini at bham. ac. uk
//detects dark spots on a bright background
//the complementary operation is "TopHat"
// well = Closed image - original

run("Duplicate...", "title=Close"); // names are temporarily exchanged
run("Duplicate...", "title=Well");
a = getNumber("Spot radius:", 1);

// for round particles
run("Maximum...", "radius="+a);
run("Minimum...", "radius="+a);

// for non-round particles this may give better results
// run("GreyscaleDilate ", "iterations="+a+" white");
// run("GreyscaleErode ", "iterations="+a+" white");

run("Image Calculator...", "image1=Well operation=Subtract image2=Close");
selectWindow("Close");
run("Close");
selectWindow("Well");

