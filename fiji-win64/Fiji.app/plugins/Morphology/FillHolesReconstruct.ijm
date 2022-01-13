//FillHolesReconstruct.txt
//G. Landini 25/5/2006
//open("/home/gabriel/ImageJ/0test.tif");

//White partilces only!

setBatchMode(true);
a=getTitle();
run("Invert");// make the background the set
run("Duplicate...", "title=no_holes");
selectWindow(a);
run("Set...", "value=0");
run("Add Borders", "top right bottom left white");
imageCalculator("AND", a,"no_holes");
run("Select None");
run("BinaryReconstruct ", "mask=no_holes seed=["+a+"] white");
run("Invert");
setBatchMode(false);
