// Thin_Results_Table.txt
// how to keep only some columns in the table using 
// J. Mutterer's Import Results Table macro
//
// G. Landini at bham. ac. uk
// 19/Jul/2007
// 3/Jun/2008

//run("Particles8 ", "white morphology show=Particles minimum=0 maximum=9999999 display overwrite redirect=None");

// save the current Results Table in the IJ folder
saveAs("Measurements", "TempResults.txt");

requires("1.35r");
lineseparator = "\n";
cellseparator = "\t";

// copies the whole RT to an array of lines
lines=split(File.openAsString("TempResults.txt"), lineseparator);

// recreates the columns headers
labels=split(lines[0], cellseparator);
//print("Labels: ", labels.length);

if (labels[0]==" ")
    k=1; // it is an ImageJ Results table, skip first column
else
    k=0; // it is not a Results table, load all columns

// The list of parameters (any order will do)
//----------------------------------------


// IMPORTANT:
// Keep the label if using Particles8_ table, otherwise it shifts the columns
// (most likely because the label is not a result, but not sure).
//
//myParams=newArray("Label", "Circ", "Area", "Perim","MinR");
//----------------------------------------
//all for the Particles8/4
//myParams=newArray("Label","Slice","Number","XStart","YStart","Perim","Area","Pixels","XM","YM","ROIX1","ROIY1","ROIX2","ROIY2","MinR","MaxR","Feret","FeretX1","FeretY1","FeretX2","FeretY2","FAngle","Breadth","BrdthX1","BrdthY1","BrdthX2","BrdthY2","CHull","CArea","MBCX","MBCY","MBCRadius","CountCorrect","AspRatio","Circ","Roundness","ArEquivD","PerEquivD","EquivEllAr","Compactness","Solidity","Concavity","Convexity","Shape","RFactor","ModRatio","Sphericity","ArBBox","Rectang","RedIntDen","RedMin","RedMax","RedMode","RedMedian","RedAverage","RedAvDev","RedStDev","RedVar","RedSkew","RedKurt","RedEntr","GreenIntDen","GreenMin","GreenMax","GreenMode","GreenMedian","GreenAverage","GreenAvDev","GreenStDev","GreenVar","GreenSkew","GreenKurt","GreenEntr","BlueIntDen","BlueMin","BlueMax","BlueMode","BlueMedian","BlueAverage","BlueAvDev","BlueStDev","BlueVar","BlueSkew","BlueKurt","BlueEntr");
//
//
//just a test
//myParams=newArray("Label","Area", "ArBBox","Rectang","RedMin");
//
//
//only morphological (no RGB variance)
//myParams=newArray("Label","Number","XStart","YStart","Perim","Area","Pixels","MinR","MaxR","Feret","Breadth","CHull","CArea","MBCRadius","AspRatio","Circ","Roundness","ArEquivD","PerEquivD","EquivEllAr","Compactness","Solidity","Concavity","Convexity","Shape","RFactor","ModRatio","Sphericity","ArBBox","Rectang","RedMin","RedMax","RedMode","RedMedian","RedAverage","RedAvDev","RedStDev","RedSkew","RedKurt","RedEntr","GreenMin","GreenMax","GreenMode","GreenMedian","GreenAverage","GreenAvDev","GreenStDev","GreenSkew","GreenKurt","GreenEntr","BlueMin","BlueMax","BlueMode","BlueMedian","BlueAverage","BlueAvDev","BlueStDev","BlueSkew","BlueKurt","BlueEntr");
//

//only morphological (no RGB variance, no blue channel, for H&E segmentation)
myParams=newArray("Label","Number","XStart","YStart","Perim","Area","Pixels","MinR","MaxR","Feret","Breadth","CHull","CArea","MBCRadius","AspRatio","Circ","Roundness","ArEquivD","PerEquivD","EquivEllAr","Compactness","Solidity","Concavity","Convexity","Shape","RFactor","ModRatio","Sphericity","ArBBox","Rectang","RedMin","RedMax","RedMode","RedMedian","RedAverage","RedAvDev","RedStDev","RedSkew","RedKurt","RedEntr","GreenMin","GreenMax","GreenMode","GreenMedian","GreenAverage","GreenAvDev","GreenStDev","GreenSkew","GreenKurt","GreenEntr");

nParams=myParams.length;
index=newArray(nParams) ;
m=-1;

for (j=k; j<labels.length; j++){
  for(l=0;l<nParams;l++){
   if (labels[j]==myParams[l]){
      index[++m]=j;
      //print (index[m]);
      setResult(labels[j],0,0);
   }
 }
}

// dispatches the data into the new RT but
// loading only the chosen parameters
run("Clear Results");
for (i=1; i<lines.length; i++) {
   items=split(lines[i], cellseparator);

   for (j=k; j<items.length; j++){
      for(l=0;l<nParams;l++){
         if (j==index[l])
          setResult(labels[j],i-1,items[j]);
      }  
   }
}
updateResults();
