// NumberParticles.txt
// G. Landini
// Analyses and numbers white or black particles
// Labels particles at their centre of mass (approx).
// Requires Particles8_class by G. Landini
//
// Do not use this macro with stacks!
// 2 Dec 2010: use original title plus "Numbered" 
// use default white regions

requires("1.30e");
a=getTitle();
w=true;
//w=getBoolean("White particles?");

wid=getWidth();
hei=getHeight();

if(w){
  //setThreshold(127,255);
  run("Particles8 ", "white  show=Particles minimum=0 maximum=999999 display overwrite");
  }
 else{
  //setThreshold(0,127);
  run("Particles8 ", "  show=Particles minimum=0 maximum=999999 display overwrite");
}

nTitle=a+"_Numbered";
run("Duplicate...", "title="+nTitle);

selectWindow(nTitle);
run("RGB Color");

for (i=0; i<nResults; i++) {    
    x = getResult('XStart', i); // start points
    y = getResult('YStart', i); 

    //x = getResult('XM', i); //centre of mass
   // y = getResult('YM', i);

    setColor(255, 0, 0);
    setFont("SanSerif",12,"bold");
    num=i; //////////// Starts from 0, make it i+1 to start from 1
    digits=lengthOf(d2s(num,0));
    offx=5;
    offy=5;
    if (x-offx+25 > wid ) offx=7*digits ;
    if (y-offy + 5 >hei) offy=-3;
    if (y<15) offy=10;
    drawString(num, x-offx, y+offy);// approx the centre of mass (never sure how wide & tall the font is)
}
