//ParticleHoleNumber.txt
// Counts the number of holes in a particle
// The results (number of holes) is given in the GrIntDen column
// Expects white (255) particles
// G. Landini  11/Apr/2008

a=getTitle();
setBatchMode(true);
run("Duplicate...", "title=holes");
run("Invert");
run("BinaryKillBorders ", "white top right bottom left");

//holes are 4-connected
run("Particles4 ", "white show=Coordinates overwrite");
run("Subtract...", "value=254");
selectWindow(a);
run("Duplicate...", "title=noholes");
run("Fill Holes");
run("Particles8 ", "white show=Particles display overwrite redirect=holes");
close();
setBatchMode(false);
