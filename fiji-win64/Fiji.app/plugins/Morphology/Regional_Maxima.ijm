// Regional maxima, by G. Landini at bham. ac. uk
// Requires the Domes_.class plugin available from
// http://www.dentistry.bham.ac.uk/landinig/
//
// Algorithm from :
// Vincent L. Morphological greyscale reconstuction in Image Analysis:
// Applications and efficient algorithms. IEEE Trans Image Proc 2(2)
// 176-201, 1993.
//
// Returns the regional maxima as white pixels on a black background
// Regional maxima are connected sets of pixels with a given value h
// (plateau at altitude h) such that every pixel in the neighbourhood 
// of the regional maxima has a strictly lower value.
// 
// All regional maxima pixels are local maxima, but not all local maxima
// pixels are regional maxima.

run("Domes ", "height=1");
setThreshold(1, 255);
run("Convert to Mask");
