// Delete_ZeroArea.txt
// G. Landini  3/May/2008
// Requires Particles8_ plugin by G. Landini
// assumes white particles
// This macro deletes particles that have area=0 (such as lines and points) to
// avoid ratio morphological parameters that have area as denominator (and are
// indicated as -1 in the Results table)
// This is to prevent "wrong" histograms with -1 entries

requires("1.30e");
w=true; //getBoolean("White particles?");

if(w){
  run("Particles8 ", "white show=Particles minimum=0 maximum=999999 display overwrite");
}
else{
  run("Particles8 ", " show=Particles minimum=0 maximum=999999 display overwrite");
  setForegroundColor(0,0,0);
}

for (i=0; i<nResults; i++) {
    x = getResult('XStart', i);
    y = getResult('YStart', i);
    a = getResult('Area', i);
    if (a==0){
       doWand(x, y);
       run("Clear");
    }
}

run("Select None");
setForegroundColor(255,255,255);
