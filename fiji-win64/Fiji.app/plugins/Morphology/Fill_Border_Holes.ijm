// Fill_Border_Holes.txt
// G.Landini 12/Apr/2004
// 26/Jul/2013 batch mode test
// This macro fills holes including those touching the borders of the image.
// This cannot be done with the "Fill Holes" command alone.
// Holes are assumed to be not only the traditional 4-connected background 
// elements, but also those that touch the image borders, but extending no more
// than 2 contiguous borders (i.e. touching one border or a corner).
//
// If you require to delete all the background elements touching any borders,
// then use the macro: BinaryKillBorders.txt on the negative of the image.
//
// Use this macro only if you are sure that you want this kind of hole deletion.
// Assumes an 8 bit binary image with white foreground and black background. 

batch_old=is("Batch Mode");
if (!batch_old) setBatchMode(true);
xe=getWidth()+2;
ye=getHeight()+2;
run("Canvas Size...", "width="+xe+" height="+ye+" position=Center ");
xem1=xe-1;
yem1=ye-1;

for (x=0;x<xe;x++) putPixel(x,0,255);
for (y=1;y<ye;y++) putPixel(xem1,y,255);
run("Fill Holes");

for (x=0;x<xem1;x++) {
 putPixel(x,0,0);
 putPixel(x,yem1,255);
}
run("Fill Holes");

for (y=0;y<yem1;y++) {
 putPixel(xem1,y,0);
 putPixel(0,y,255);
}
run("Fill Holes");

for (x=1;x<xe;x++) {
 putPixel(x,0,255);
 putPixel(x,yem1,0);
}
run("Fill Holes");
run("Canvas Size...", "width="+xe-2+" height="+ye-2+" position=Center ");
if (!batch_old) setBatchMode(false);

