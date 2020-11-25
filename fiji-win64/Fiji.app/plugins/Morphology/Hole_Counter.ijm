// Hole_counter.txt
// counts the number of particles, holes and Euler number of a
// binary image (with white particles on a black background),
// The Euler number is the number of particles minus the number
// of holes and it is a measure of the topology of the image.
// G. Landini at bham. ac. uk
// 18 May 2008
// v. 2, Corrected: strictly speaking,  8-connected particles can 
// only have 4-connected holes
run("Select None");
setBatchMode(true);
run("Particles8 ", "white show=Particles overwrite");
particles=nResults;
run("Duplicate...", "title=Holes");
run("Particles4 ", " exclude show=Particles display overwrite");
close();
showStatus(particles+" particles and "+nResults+" holes. Euler number: " +(particles-nResults));
print(particles+" particles and "+nResults+" holes. Euler number: " +(particles-nResults));
setBatchMode(false);
