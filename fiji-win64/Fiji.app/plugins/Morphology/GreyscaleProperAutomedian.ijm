// GreyscaleProperAutomedian
// morphological filers based on f=MAX[MIN(f,COC(f)), OCO(f)]
// (O and C are the "way round" in ImageJ)
// by G. Landini at bham. ac. uk

a = getNumber("Kernel radius:", 1);
setBatchMode(true);

run("Duplicate...", "title=automedian");
run("Duplicate...", "title=proper_closed");
selectWindow("proper_closed");


run("Maximum...", "radius=" + a);
run("Minimum...", "radius=" + a);

run("Minimum...", "radius=" + a);
run("Maximum...", "radius=" + a);

run("Maximum...", "radius=" + a);
run("Minimum...", "radius="+ a);

run("Image Calculator...", "image1=proper_closed operation=Min image2=automedian");

selectWindow("automedian");
run("Minimum...", "radius=" + a);
run("Maximum...", "radius=" + a);


run("Maximum...", "radius=" + a)
run("Minimum...", "radius=" + a);

run("Minimum...", "radius=" + a);
run("Maximum...", "radius=" + a);

run("Image Calculator...", "image1=automedian operation=Max image2=proper_closed");

//selectWindow("proper_closed");
//run("Close");
//beep();
setBatchMode(false);
