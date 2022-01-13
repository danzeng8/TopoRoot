// CloseByReconstructionTopHat
// top hat by closing by reconstruction
// G. Landini 10 May 2009

a=getTitle();
radius=getNumber("Radius", 4);
setBatchMode(true);
run("Duplicate...", "title=closerecttophat");
selectWindow("closerecttophat");
run("Maximum...", "radius="+radius);
run("Invert");
selectWindow(a);
run("Invert");
run("GreyscaleReconstruct ", "mask="+a+" seed=closerecttophat");
run("Invert");
selectWindow("closerecttophat");
run("Invert");
imageCalculator("Subtract ", "closerecttophat",a);
setBatchMode(false);
