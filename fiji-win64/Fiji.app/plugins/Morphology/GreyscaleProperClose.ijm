// proper_close 
// by G. Landini at bham. ac. uk
// OCO filter corresponds to mmasf OCO in matlab
requires("1.31p");

b=getBoolean("Proper Close\n \nWhite foreground?");
a = getNumber("Kernel radius:", 1);


if (b){
	run("Duplicate...", "title=ori");
	run("Duplicate...", "title=proper_closed");

	selectWindow("proper_closed");

	run("Minimum...", "radius=" + a);
	run("Maximum...", "radius="+ a);

	run("Maximum...", "radius=" + a);
	run("Minimum...", "radius=" + a);

	run("Minimum...", "radius=" + a);
	run("Maximum...", "radius=" + a);

	run("Image Calculator...", "image1=proper_closed operation=Max image2=ori");
	selectWindow("ori");
	run("Close");
	}
else {
	run("Duplicate...", "title=ori");
	run("Duplicate...", "title=proper_closed");
	selectWindow("proper_closed");

	run("Maximum...", "radius=" + a);
	run("Minimum...", "radius=" + a);

	run("Minimum...", "radius=" + a);
	run("Maximum...", "radius=" + a);

	run("Maximum...", "radius=" + a);
	run("Minimum...", "radius=" + a);

	run("Image Calculator...", "image1=proper_closed operation=Min image2=ori");
	selectWindow("ori");
	run("Close");
}
