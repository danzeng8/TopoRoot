// KeepLargestParticle.txt
// G. Landini  28/Dec/2003
// Based on CircularParticles.txt
//
// Do not use this macro with stacks!

requires("1.29n");
setThreshold(0, 127);
run("Set Measurements...", "area perimeter circularity decimal=3");
run("Analyze Particles...", "minimum=1 maximum=999999 bins=20 show=Nothing clear record");

ar=0;
for (i=0; i<nResults; i++) {    
    ca = getResult('Area', i);
    if (ca>ar) ar=ca;
}

for (i=0; i<nResults; i++) {
    x = getResult('XStart', i);
    y = getResult('YStart', i);
    ca = getResult('Area', i);
    if (ca<ar) {
        doWand(x,y);
        run("Clear");
    }
}

run("Select None");
