// BinaryErode_test macro for ImageJ
// by G. Landini at bham. ac. uk
// 5/11/2003.
// 19/10/2008
//
// tests all coefficients of binary erosion
// uses BinaryErode_ plugin available from http://dentistry.bham.ac.uk/landinig/
// outputs stack of a rectangle with background binary noise
// slice 1 is the original: white is foreground, black is background
// slice 2 eroded with coefficient 7
// slice 3 eroded with coefficient 6
// slice 4 eroded with coefficient 5
// slice 5 eroded with coefficient 4
// slice 6 eroded with coefficient 3
// slice 7 eroded with coefficient 2
// slice 8 eroded with coefficient 1
// slice 9 eroded with coefficient 0 (classic dilation)
// in white the original elements, in red the eroded elements

a = getNumber("Number of iterations: (1 - 25l)", 1);

run("New...", "name=aaa_morphotest type=8-bit fill=Black width=100 height=100 slices=1");
run("Add Specified Noise...", "standard=255");
makeRectangle(23, 21, 45, 48);
run("Fill");
run("Select None");
run("Threshold", "thresholded remaining black");
setThreshold(123, 255);
run("Invert");

run("Duplicate...", "title=aaa_morphotest7");
run("BinaryErode ", "coefficient=7 iterations="+a+" white");
run("Image Calculator...", "image1=aaa_morphotest7 operation=Average image2=aaa_morphotest create");
selectWindow("Result of aaa_morphotest7");
selectWindow("aaa_morphotest7");
run("Close");

selectWindow("aaa_morphotest");
run("Duplicate...", "title=aaa_morphotest6");
run("BinaryErode ", "coefficient=6 iterations="+a+" white");
run("Image Calculator...", "image1=aaa_morphotest6 operation=Average image2=aaa_morphotest create");
selectWindow("Result of aaa_morphotest6");
selectWindow("aaa_morphotest6");
run("Close");

selectWindow("aaa_morphotest");
run("Duplicate...", "title=aaa_morphotest5");
run("BinaryErode ", "coefficient=5 iterations="+a+" white");
run("Image Calculator...", "image1=aaa_morphotest5 operation=Average image2=aaa_morphotest create");
selectWindow("Result of aaa_morphotest5");
selectWindow("aaa_morphotest5");
run("Close");

selectWindow("aaa_morphotest");
run("Duplicate...", "title=aaa_morphotest4");
run("BinaryErode ", "coefficient=4 iterations="+a+" white");
run("Image Calculator...", "image1=aaa_morphotest4 operation=Average image2=aaa_morphotest create");
selectWindow("Result of aaa_morphotest4");
selectWindow("aaa_morphotest4");
run("Close");

selectWindow("aaa_morphotest");
run("Duplicate...", "title=aaa_morphotest3");
run("BinaryErode ", "coefficient=3 iterations="+a+" white");
run("Image Calculator...", "image1=aaa_morphotest3 operation=Average image2=aaa_morphotest create");
selectWindow("Result of aaa_morphotest3");
selectWindow("aaa_morphotest3");
run("Close");

selectWindow("aaa_morphotest");
run("Duplicate...", "title=aaa_morphotest2");
run("BinaryErode ", "coefficient=2 iterations="+a+" white");
run("Image Calculator...", "image1=aaa_morphotest2 operation=Average image2=aaa_morphotest create");
selectWindow("Result of aaa_morphotest2");
run("Fire");
selectWindow("aaa_morphotest2");
run("Close");

selectWindow("aaa_morphotest");
run("Duplicate...", "title=aaa_morphotest1");
run("BinaryErode ", "coefficient=1 iterations="+a+" white");
run("Image Calculator...", "image1=aaa_morphotest1 operation=Average image2=aaa_morphotest create");
selectWindow("Result of aaa_morphotest1");
selectWindow("aaa_morphotest1");
run("Close");

selectWindow("aaa_morphotest");
run("Duplicate...", "title=aaa_morphotest0");
run("BinaryErode ", "coefficient=0 iterations="+a+" white");
run("Image Calculator...", "image1=aaa_morphotest0 operation=Average image2=aaa_morphotest create");
selectWindow("Result of aaa_morphotest0");
selectWindow("aaa_morphotest0");
run("Close");

run("Convert Images to Stack");
run("Fire");








