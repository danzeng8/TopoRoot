//Hysteresis.txt by G. Landini at bham. ac. uk
//
// Hysteresis thresholding is useful to segment edges
// This macro assumes that the object is bright (usually the edge gradient)
// First set the threshold of the "safe zone" (for sure belongs to the "object")
// then set the threshold for the "unsafe zone (for sure is outside the "object")
// The "in between" zone is called the "fuzzy zone".
// Hysteresis thresholding adds those parts in the fuzzy zone
// that are connected to the safe zone.
//
// This macro creates 2 images: "Reconstructed" is the hysteresis, while
// "Result of Result" shows the safe zone (white), the pixels added to the
// safe zone (yellow), the pixels of the fuzzy zone not added (purple)
// and the unsafe zone in black.

run("Duplicate...", "title=Unsafe");
run("Duplicate...", "title=Safe");

a=getNumber("Safe zone [255-?]",0);
selectWindow("Safe");
setThreshold(a, 255);
run("Threshold", "thresholded remaining");

b=a;
b=getNumber("Unsafe zone [0-?]",b);
selectWindow("Unsafe");
setThreshold(0, b);
selectWindow("Unsafe");
run("Threshold", "thresholded remaining");

run("Duplicate...", "title=Hysteresis");
run("Invert");
run("BinaryReconstruct ", "mask=Hysteresis seed=Safe create white");

run("Image Calculator...", "image1=Reconstructed operation=Average image2=Hysteresis create");
run("Image Calculator...", "image1=Safe operation=Average image2=Reconstructed create");
run("Image Calculator...", "image1='Result of Reconstructed' operation=Average image2='Result of Safe' create");
selectWindow("Hysteresis");
run("Close");
selectWindow("Result of Reconstructed");
run("Close");
selectWindow("Result of Safe");
run("Close");
selectWindow("Unsafe");
run("Close");
selectWindow("Safe");
run("Close");
selectWindow("Result of Result");
run("Fire");
