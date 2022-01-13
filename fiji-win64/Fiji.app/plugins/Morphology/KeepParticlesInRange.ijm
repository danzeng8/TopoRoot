// KeepParticlesInRange.txt
// G. Landini  28/Dec/2003, 28/Jun/2007, 5/Jun/2008
// Based on CircularParticles.txt
//
// Uses the Particles8 as analyser engine and considers holes and child-particles.
// Uses particle size in pixels rather than area
// 
// Requires Particles8_class by G. Landini
// Demonstrates how to use the results from Particles8 in a macro via the ResultsTable
//
// Do not use this macro with stacks!
// Do not use Particles4 instead of 8 because the reconstruction below is based 
// on 8-neigbour dilation!
// Assumes white particles

requires("1.29n");
run("Particles8 ", "white show=Particles overwrite display");
t=getTitle();


Dialog.create("Keep in Range");
Dialog.addNumber("Minimum", 100);
Dialog.addNumber("Maximum", 500);
Dialog.show();

min=Dialog.getNumber();
max=Dialog.getNumber();

newImage("Subset", "8-bit Black", getWidth(), getHeight(), 1);

// select particles containing between 100 and 200 pixels
for (i=0; i<nResults; i++) {
    x = getResult('XStart', i);
    y = getResult('YStart', i);
    ca = getResult('Pixels', i);
    if (ca>min && ca<max) {
        setPixel (x,y,255);   // set the start coordinates
    }
}

// Reconstruct the original based on the start coordinates of the particles that passed the test
run("BinaryReconstruct ", "mask=" + t + " seed=Subset  white");
