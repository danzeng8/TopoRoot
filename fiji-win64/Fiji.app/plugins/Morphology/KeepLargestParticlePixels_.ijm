// KeepLargestWParticle_Pixels.txt
// G. Landini  28/Dec/2003
// June 2004 white or black particles
// Keeps the largest particle in the image.
// Same macro as KeepLargestParticle.txt but using the Particles8 as analyser engine
// (takes into account holes and child-particles). Uses particle size in pixels rather than area.
// Requires Particles8_class by G. Landini
//
// This macro assumes white particles.
//
// Do not use this macro with stacks!

requires("1.30e");
w=getBoolean("White particles?");

if(w){
  //setThreshold(127,255);
  run("Particles8 ", "white  show=Particles overwrite");
  }
 else{
  //setThreshold(0,127);
  run("Particles8 ", "  show=Particles overwrite");
}

// look for Pixels, not Area!

ar=0;
for (i=0; i<nResults; i++) {    
    ca = getResult('Pixels', i);
    if (ca>ar) ar=ca;
}

//Particles8 filters particles based on particle Pixels, not Area.
if(w)
  run("Particles8 ", "white  show=Particles filter minimum=" + ar +" maximum="+ ar +" overwrite");
else
  run("Particles8 ", "  show=Particles filter minimum=" + ar +" maximum="+ ar +" overwrite");
