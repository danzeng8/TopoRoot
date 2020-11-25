// Summarize_Results.txt
// G. Landini @ bham. ac. uk
// 9/Oct/2006
//16/June/2007 nice output
//------------


title=getTitle();
run("Select None");

if (!isOpen("Results"))
 exit("No Results window found. Please run Analyze Particles or Particles8_.");

// To generate the results table:
// run("Set Measurements...", "area perimeter bounding circularity integrated limit redirect=None decimal=3");
// run("Analyze Particles...", "size=0-Infinity circularity=0.00-1.00 show=Nothing display clear record");
// or
// run("Particles8 ", "white morphology show=Particles display redirect=None overwrite");
//
// Make sure that you redirect the analysis to the appropriate image, if required.

selectWindow("Results");
text = getInfo();
lines = split(text, "\n");
columns = split(lines[0], "\t");

if (columns[0]==" ")
 columns[0]= "Number";

param=newArray(nResults);

Dialog.create("Summarize Results");
Dialog.addMessage("Calculates several statistics\nfrom data in the Results Table.");
Dialog.addCheckbox("Clear Log window", true);
Dialog.addCheckbox("Ignore \"-1\"", false);
Dialog.addCheckbox("Nice output", true);


Dialog.show()
clearw=Dialog.getCheckbox();
ignore=Dialog.getCheckbox();
nice=Dialog.getCheckbox();

setBatchMode(true);

if (clearw)
 print("\\Clear");

print("----Results_Table_Summary----");
if (ignore)
 print("Ignoring:\"-1\"");

  if (nice)
    print("warn param n average min max sd var adev skew kurt");


for (i=0; i<columns.length; i++){
 dmax=-1000000000;
 dmin= 1000000000;
 tot=0;
 ave=0;
 nc=nResults;
 hasmin1=false;

 for (j=0; j<nResults; j++) {
     data1=getResult(columns[i], j);
     if (ignore && data1==-1)
       nc--;
     else{
       if(data1==-1) hasmin1=true;
       if (data1>dmax) dmax=data1;
       if (data1<dmin) dmin=data1;
       tot+=data1;
     }
 }
 ave=tot/nc;
 vari=0;
 skew=0;
 kurt=0;
 sdev=0;
 adev=0;
 p=0;

 for(j=0;j<nResults;j++){
   data1=getResult(columns[i], j);
    if (ignore && data1==-1)
      beep();
   else{
     s = data1 - ave;
     adev+=abs(s);
     p = s * s;
     vari+= p;
     p*=s;
     skew+= p;
     p*= s;
     kurt+= p;
   }
 }

 adev/= nc;
 vari/=(nc-1);
 sdev=sqrt(vari);

 if (vari> 0){
  //numerical recipes method, different than Excel & SPSS
  skew = skew /(nc * vari * sdev);
  kurt = kurt /(nc * vari * vari) - 3;
 }

if (hasmin1)
 warn="contains:-1 ";
else
 warn=" ";



 if ((indexOf(columns[i],"X")==-1 && indexOf(columns[i],"Y")==-1) && (columns[i]!="Number" && columns[i]!="Slice" && columns[i]!="Label")) {
   if (nice)
    print(warn+ columns[i]  + " " + nc+ " " +d2s(ave,5)+ " " +d2s(dmin,5) + " " +d2s(dmax,5)+ " " +d2s(sdev,5)+ " " +d2s(vari,5)+ " " +d2s(adev,5)+ " " +d2s(skew,5)+ " " +d2s(kurt,5));
   else
    print(warn+columns[i]  +" [" + nc + "]  aver: "+d2s(ave,5)+"  min: "+d2s(dmin,5) +"  max: "+d2s(dmax,5)+"  sd: "+d2s(sdev,5)+"  var: "+d2s(vari,5)+"  adev: "+d2s(adev,5)+"  skew: "+d2s(skew,5)+"  kurt: "+d2s(kurt,5));
  }

}
setBatchMode(false);
if (!nice)
 print("----End----");




