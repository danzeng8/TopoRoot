// Morphological_Clustering.txt
// Uses k-means clustering to classify particles based on their 
// morphological and greyscale properties.
// requires:
//  1.  k-means clustering plugin by Jarek Sacha  http://ij-plugins.sourceforge.net/plugins/clustering/index.html
//  2. the Glasbey look up table (renamed as "006-glasbey.lut")
//
// G. Landini at bham. ac. uk
// 31/Jul/2008
// 23/Dec/2009 fixed re-opening of Results Table
// If you do not know what z-scores and k-means clustering means, please find
// out, so you know what you are doing. 
// 12/Sep/2010 fixed the import of the original Results Table which stopped working after some ij.jar update
// 4/Feb/2014 fixed reloading Results Table again!

requires("1.35r");
a=getTitle();
if(getBoolean("Run Particles8?"))
   run("Particles8 ", "white morphology show=Particles display overwrite redirect=None");

// save the current Results Table in the IJ folder
myResults="TempResults.txt";
ijdir = getDirectory("imagej");
saveAs("Results", ijdir + myResults);
//print (ijdir+ myResults);

// The list of parameters (any order will do)
//----------------------------------------
//all possible for Particles8/4 you should add some more for Lines8
//myParams=newArray("Label","Slice","Number","XStart","YStart","Perim","Area","Pixels","XM","YM","ROIX1","ROIY1","ROIX2","ROIY2","MinR","MaxR","Feret","FeretX1","FeretY1","FeretX2","FeretY2","FAngle","Breadth","BrdthX1","BrdthY1","BrdthX2","BrdthY2","CHull","CArea","MBCX","MBCY","MBCRadius","CountCorrect","AspRatio","Circ","Roundness","ArEquivD","PerEquivD","EquivEllAr","Compactness","Solidity","Concavity","Convexity","Shape","RFactor","ModRatio","Sphericity","ArBBox","Rectang","GrIntDen","GrMin","GrMax","GrMode","GrMedian","GrAverage","GrAvDev","GrStDev","GrSkew","GrKurt","GrEntr","RedIntDen","RedMin","RedMax","RedMode","RedMedian","RedAverage","RedAvDev","RedStDev","RedVar","RedSkew","RedKurt","RedEntr","GreenIntDen","GreenMin","GreenMax","GreenMode","GreenMedian","GreenAverage","GreenAvDev","GreenStDev","GreenVar","GreenSkew","GreenKurt","GreenEntr","BlueIntDen","BlueMin","BlueMax","BlueMode","BlueMedian","BlueAverage","BlueAvDev","BlueStDev","BlueVar","BlueSkew","BlueKurt","BlueEntr","PLength", "SkelLength","1Point" ,"2Point","3Point","4Point","5Point","6Point","7Point","8Point");
//
//just a test
//myParams=newArray("Label","Area", "ArBBox","Rectang","RedMin");
//
//only morphological (no *Var (correlated with *StDev), no *IntDen (correlated with Area and *Average)
//myParams=newArray("Label","Slice", "Number","XStart","YStart","Perim","Area","Pixels","MinR","MaxR","Feret","Breadth","CHull","CArea","MBCRadius","AspRatio","Circ","Roundness","ArEquivD","PerEquivD","EquivEllAr","Compactness","Solidity","Concavity","Convexity","Shape","RFactor","ModRatio","Sphericity","ArBBox","Rectang","GrMin","GrMax","GrMode","GrMedian","GrAverage","GrAvDev","GrStDev","GrSkew","GrKurt","GrEntr","RedMin","RedMax","RedMode","RedMedian","RedAverage","RedAvDev","RedStDev","RedSkew","RedKurt","RedEntr","GreenMin","GreenMax","GreenMode","GreenMedian","GreenAverage","GreenAvDev","GreenStDev","GreenSkew","GreenKurt","GreenEntr","BlueMin","BlueMax","BlueMode","BlueMedian","BlueAverage","BlueAvDev","BlueStDev","BlueSkew","BlueKurt","BlueEntr","PCA1","PCA2","PCA3","PCA4","PCA5","PCA6","PLength", "SkelLength","1Point" ,"2Point","3Point","4Point","5Point","6Point","7Point","8Point");

myParams=newArray("Label","Slice", "Number","XStart","YStart","Perim","Area","Pixels","MinR","MaxR","Feret","Breadth","CHull","CArea","MBCRadius","AspRatio","Circ","Roundness","ArEquivD","PerEquivD","EquivEllAr","Compactness","Solidity","Concavity","Convexity","Shape","RFactor","ModRatio","Sphericity","ArBBox","Rectang","GrIntDen","GrMin","GrMax","GrMode","GrMedian","GrAverage","GrAvDev","GrStDev","GrSkew","GrKurt","GrEntr","RedIntDen","RedMin","RedMax","RedMode","RedMedian","RedAverage","RedAvDev","RedStDev","RedSkew","RedKurt","RedEntr","GreenIntDen","GreenMin","GreenMax","GreenMode","GreenMedian","GreenAverage","GreenAvDev","GreenStDev","GreenSkew","GreenKurt","GreenEntr","BlueIntDen","BlueMin","BlueMax","BlueMode","BlueMedian","BlueAverage","BlueAvDev","BlueStDev","BlueSkew","BlueKurt","BlueEntr","PCA1","PCA2","PCA3","PCA4","PCA5","PCA6","PLength", "SkelLength","1Point" ,"2Point","3Point","4Point","5Point","6Point","7Point","8Point");

//check parameters index
//for (i=0;i<myParams.length;i++){
//  print(myParams[i], i);
//}

nParams=myParams.length;
defParams=newArray(nParams);

// ignore the following
defParams[0]=false; //Label
defParams[1]=false; //Slice
defParams[2]=false; // Number
defParams[3]=false; // XStart
defParams[4]=false; // YStart
 
// do not ignore the rest
for (i=5;i<nParams;i++){
   defParams[i]=true;
}

showStatus("Calculating Z-scores...");

for (i=0;i<nParams;i++){
    if(defParams[i] ){
       if (!isNaN(getResult(myParams[i], 0))) {

          // valid column,  get the mean 
          total=0;
          for(j=0;j<nResults;j++){
             data1=getResult(myParams[i], j);
             if (data1==-1)
                 defParams[i]=false; // has "-1", so do not use this column
             total+=data1;
          }
          mean=total/nResults;

          // get sd 
          vari=0;
          for(j=0;j<nResults;j++){
             total+=getResult(myParams[i], j);
             s = getResult(myParams[i], j) - mean;
             vari=vari + s * s;
          }
          vari= vari/(nResults-1);
          sdev=sqrt(vari);

          // rewrite the table with the Z-scores 
          for(j=0;j<nResults;j++){
             setResult( myParams[i], j, (getResult(myParams[i], j)-mean)/sdev ) ;
          }
      }
      else
         defParams[i]=false; // has a -1, so remove column from list
   }
    //print (i, myParams[i], defParams[i]); 
}

updateResults();

n=0;
for (i=0;i<nParams;i++){
   if(defParams[i])
      n++;
}

kswitches=newArray(n);
kParams=newArray(n);
s=-1;
for (i=0;i<nParams;i++){
   if(defParams[i]){
      kswitches[++s]=true;
      kParams[s]=myParams[i];
   }
}

showStatus("");

Dialog.create("k-Means: choose parameters");

Dialog.addMessage("Morphological Clustering");
Dialog.addNumber("Number of clusters", 2);
Dialog.addMessage("If using PCA, uncheck \"Z-scores\"");
Dialog.addCheckbox("Z-scores instead of raw data", true);
Dialog.addMessage("The following "+ n +" valid columns (without -1) were found:");
Dialog.addCheckboxGroup(8,8, kParams, kswitches);
Dialog.show();

nClusters=Dialog.getNumber();

s=0;
zscores=Dialog.getCheckbox();
for (i=0;i<n;i++){
    kswitches[i]=Dialog.getCheckbox(); //update checkboxes
    if(kswitches[i])
       s++;
    //print (i, kParams[i], kswitches[i]); 
}

if (!zscores){
   //reload table and use that
   run("Results... ", "open="+ ijdir + myResults); 
}
newImage("_data", "32-bit Black", nResults, 1, s);

j=0;
for (i=0;i<kswitches.length;i++){
   //print (i+1);
   if (kswitches[i]){
      setSlice(++j);
      // data
      for(k=0;k<nResults;k++){
         //print (i, param[i], getResult(param[i], k) );
         setPixel(k,0, getResult(kParams[i], k) );
      }
   }
}

run("k-means Clustering ...", "number_of_clusters="+nClusters+" cluster_center_tolerance=0.00000100 enable_randomization_seed randomization_seed=48");
selectWindow("Clusters");

label=newArray(nResults);
// get all the labels
for (i=0;i<nResults;i++)
    label[i]=getPixel(i,0)+1;

//paint the cells
selectWindow(a);
cslice=0;
for (i=0;i<nResults;i++){
    setColor(label[i]);
    slice=getResult("Slice", i);
    if(slice!=cslice){
       cslice=slice;
       setSlice(slice);
    }
    floodFill(getResult("XStart", i),getResult("YStart", i),"8-connected");  
}
run("006-glasbey");
updateDisplay();

// make a montage of the data parameters
//selectWindow("_data");
//run("Make Montage...", "columns=1 rows="+s+" scale=1 first=1 last="+s+" increment=1 border=0");
//selectWindow("Montage");
//rename("Parameters");
//run("007-phase");
//run("In");
selectWindow("Clusters");
close();
selectWindow("_data");
close();

//if using the z scores, reload the original table
if (zscores) 
   run("Results... ", "open="+ ijdir + myResults); 


for (i=0;i<nResults;i++){
    setResult("kClass"+nClusters, i,label[i]);  
 }
updateResults();
