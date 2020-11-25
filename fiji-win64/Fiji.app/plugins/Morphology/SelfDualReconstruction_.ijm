//SelfDualReconstruction
// G. Landini at bham. ac. uk
// 4 Oct 2010
// Self dual reconstruction is the 'reconstruction by dilation' of the original using a seed image
// if the original >= seed and the 'reconstruction by erosion' if otherwise.
// The reconstruction by erosion corresponds to the complement of the reconstruction
// of the complement of the mask with the complement of the seed (i.e. invert both images,
// reconstruct and invert the result).
// Here the seed is the median filtered image of the original.
// This procedure is used to simplify greyscale images (levelling) while preserving shape.
// The difference between the original and the dual reconstructed image is a measure of texture
radius=getNumber("Median radius",5);
setBatchMode(true);
a=getTitle();
run("Duplicate...", "title=_median");
run("Median...", "radius="+radius);
run("GreyscaleReconstruct ", "mask=["+a+"] seed=_median create");
selectWindow("Reconstructed");
rename("_1");
run("Invert");
selectWindow("_median");
run("Invert");
run("GreyscaleReconstruct ", "mask=_1 seed=_median create");
run("Invert");
rename("DualReconstructed");
setBatchMode(false);
