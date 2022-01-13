// proper_open 
// by G. Landini at bham. ac. uk
// COC filter corresponds to mmasf COC in matlab

requires("1.31p");

b=getBoolean("Proper Close\n \nWhite foreground?");
a = getNumber("Kernel radius:", 1);


if (b){
	run("Duplicate...", "title=ori");
	run("Duplicate...", "title=proper_opened");
	selectWindow("proper_opened");

	run("Maximum...", "radius=" + a);
	run("Minimum...", "radius=" + a);

	run("Minimum...", "radius=" + a);
	run("Maximum...", "radius=" + a);

	run("Maximum...", "radius=" + a);
	run("Minimum...", "radius=" + a);

	run("Image Calculator...", "image1=proper_opened operation=Min image2=ori");
	selectWindow("ori");
	run("Close");
	}
else {
	run("Duplicate...", "title=ori");
	run("Duplicate...", "title=proper_opened");
	selectWindow("proper_opened");

	run("Minimum...", "radius=" + a);
	run("Maximum...", "radius="+ a);

	run("Maximum...", "radius=" + a);
	run("Minimum...", "radius=" + a);

	run("Minimum...", "radius=" + a);
	run("Maximum...", "radius=" + a);

	run("Image Calculator...", "image1=proper_opened operation=Max image2=ori");
	selectWindow("ori");
	run("Close");
}
