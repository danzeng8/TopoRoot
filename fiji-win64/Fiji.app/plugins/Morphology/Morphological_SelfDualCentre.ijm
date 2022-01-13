// Morphological_SefDualCentre.txt
// G. Landini at bham. ac. uk
// 5 Oct 2010
// A self-dual filter that  outputs the median of the 
// original, CO and OC filters  (the closer to the original image)
// See: P. Soille (2004) Morphological Image Analysis, p 255

setBatchMode(true);
radius=getNumber("Radius", 1);
run("Duplicate...", "title=__Ori");
run("Duplicate...", "title=__OC");
run("Duplicate...", "title=__CO");
selectWindow("__CO");
run("Maximum...", "radius="+radius); //Close
run("Minimum...", "radius="+radius);

run("Minimum...", "radius="+radius); //Open
run("Maximum...", "radius="+radius);

selectWindow("__OC");
run("Minimum...", "radius="+radius); // Open
run("Maximum...", "radius="+radius);

run("Maximum...", "radius="+radius); //Close
run("Minimum...", "radius="+radius);
run("Images to Stack", "name=Stack title=__ use");
run("Z Project...", "projection=Median");
selectWindow("MED_Stack");
setMinAndMax(0.0, 255.0);
run("8-bit");
setBatchMode(false);
