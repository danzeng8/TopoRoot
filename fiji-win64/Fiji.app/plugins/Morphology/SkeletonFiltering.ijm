//SkeletonFiltering
// removes small branches that get detached after n prunings
// See P. Soille. Morphological Image Analysis (2004), p199
// G. Landini at bham ac uk

setBatchMode(true);
a=getTitle();
run("Duplicate...", "title=pruned");
n=getNumber("Prunings", 5);
for (i=0;i<n;i++)
    run("BinaryThin ", "kernel_a='0 2 2 0 1 0 0 0 0'  rotations='rotate 45' iterations=1 white"); //prune
imageCalculator("Subtract create", a, "pruned");
rename("branches");
selectWindow("pruned");
run("Duplicate...", "title=endPoints");
selectWindow("endPoints");
run("BinaryConnectivity ", "white");
setThreshold(2, 2);
run("Convert to Mask");
run("Dilate"); // so the end points overlap the pruned skeleton
run("BinaryReconstruct ", "mask=branches seed=endPoints create white");
imageCalculator("Add create", "pruned","Reconstructed");
run("Skeletonize"); // optional 
//imageCalculator("Average create", "ttt","Result of pruned"); // to see what has changed
setBatchMode(false);
