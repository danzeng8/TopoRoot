// UnbiasedCounting.txt
// Counts particles that only touch the top and right image frames
// assumes white particles on a black background
// G.Landini
run("Colors...", "foreground=white background=black selection=yellow");
run("Options...", "iterations=1 count=1 black pad edm=Overwrite do=Nothing");
run("Blobs (25K)");
a=getTitle();
setThreshold(125, 255);
run("Convert to Mask");

run("Duplicate...", "title=copy");
run("Select All");
run("Fill");
run("Invert");
run("Select None");
w=getWidth()-1;
h=getHeight()-1;
makeLine(0, 0, 0,h);
run("Draw");
makeLine(0, h, w, h);
run("Draw");
run("Image Calculator...", "image1="+a+" operation=AND image2=copy create");
run("BinaryReconstruct ", "mask="+a+" seed=[Result of "+a+"] white");
run("Image Calculator...", "image1="+a+" operation=Subtract image2=[Result of "+a+"]");
selectWindow("copy");
close();
selectWindow("Result of "+a);
close();

setAutoThreshold();
run("Analyze Particles...", "minimum=1 maximum=999999 bins=20 show=Nothing display clear summarize record");
