// Impose_Minimum
// G. Landini 10 May 2009
// This modifies the image to contain only those valleys and minima 
// given by the binary seed image.
// One can use the Extended Minima function as the binary seed.

arg = getArgument();
if (lengthOf(arg)>0){
    argi = split(arg, "");
    ori=argi[0];
    seed=argi[1];
}
else{
    setBatchMode(true);
     title=getTitle();
     imagen=newArray(nImages);
     imagen[0]=title; 
     if (nImages<2)
        exit("Two images needed.");
     j=0;
     for (i=1;i<=nImages();i++) {
       selectImage(i);
       temp=getTitle();
       if (temp!=title)
           imagen[++j]=temp;
     }

   selectWindow(title);
   setBatchMode(false);

   Dialog.create("Impose Minimum");
   Dialog.addChoice("Original",imagen, imagen[0]); 
   Dialog.addChoice("Binary seed",imagen, imagen[1]);
   Dialog.show();

   ori=Dialog.getChoice();
   seed=Dialog.getChoice();
}

//seed="BW";
//ori="bonemarr.tif";
setBatchMode(true);
selectWindow(ori);
run("Duplicate...", "title=fp1");
run("Add...", "value=1");
selectWindow(seed);
run("Invert");
imageCalculator("Min ", "fp1", seed);
selectImage("fp1");
run("Invert");
selectWindow(seed);
run("Invert");
run("GreyscaleReconstruct ", "mask=fp1 seed="+ seed+" create");
run("Invert");
rename("imposemin");
setBatchMode(false);
