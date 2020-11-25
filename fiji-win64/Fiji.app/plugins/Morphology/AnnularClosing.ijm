// AnnularClosing
// gets rid of isolated blobs that are smaller than the diameter and further away 
// than the diameter from other blobs
// uses Gray_Morphology plugin
// G. Landin at bham. ac. uk
// 11 Sep 2010

//setBatchMode(true);
a=getTitle()
k=getNumber("Annulus diameter", 15);
run("Duplicate...", "title=seed");

c=floor(k/2);
kernel=" ";
for (y=0;y<k;y++){
  for (x=0;x<k;x++){
   d=sqrt(pow((y-c),2)+pow((x-c),2));
   if (d<=(k/2) && d>(k/2)-1)
       kernel+="255 ";
   else
       kernel+="0 ";
  }
}
//print (kernel);
run("Gray Morphology", "radius=1 type=[free form] operator=dilate text1=[ "+kernel+" ]");
run("GreyscaleReconstruct ", "mask="+a+" seed=seed create");
selectWindow("seed");
close();
selectWindow("Reconstructed");
rename("AnnularClosed");
setBatchMode(false);
