// DrawFeret&Breadth.txt
// G. Landini  22/Dec/2004, 8/12/2011
// Requires Particles8_ plugin by G. Landini
//


requires("1.30e");
w=getBoolean("White particles?");

if(w){
  //setThreshold(127,255);
run("Particles8 ", "white morphology show=Particles minimum=0 maximum=999999 display overwrite");
  }
 else{
  //setThreshold(0,127);
run("Particles8 ", " morphology show=Particles minimum=0 maximum=999999 display overwrite");

}
thisSlice=getSliceNumber();
for (i=0; i<nResults; i++) {
    s =getResult('Slice', i);
    f =getResult('Feret', i);
    x1 = getResult('FeretX1', i);
    y1 = getResult('FeretY1', i);
    x2 = getResult('FeretX2', i);
    y2 = getResult('FeretY2', i);
    bx1=getResult('BrdthX1', i);
    by1=getResult('BrdthY1', i);
    bx2=getResult('BrdthX2', i);
    by2=getResult('BrdthY2', i);

    setColor(127);
    if (thisSlice!=s) {
      setSlice(s);
      thisSlice=getSliceNumber();
    }
    if (f>0){
      drawLine(x1,y1,x2,y2);

      setColor(200);
      r= ((bx1-x1)*(x2-x1)+(by1-y1)*(y2-y1))/(f*f);
      px=x1+r*(x2-x1);
      py=y1+r*(y2-y1);
      drawLine(bx1,by1,px,py);

      r= ((bx2-x1)*(x2-x1)+(by2-y1)*(y2-y1))/(f*f);
      px=x1+r*(x2-x1);
      py=y1+r*(y2-y1);
      drawLine(bx2,by2,px,py);
   }
}


