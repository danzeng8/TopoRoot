// MCentroids.txt
// Morphological centroids by thinning
// assumes white particles, seems to be working ok
// G.Landini


run("BinaryThin2 ", "kernel_a='0 2 2 0 1 1 0 0 2 ' kernel_b='0 0 2 0 1 1 0 2 2 ' rotations='rotate 45' iterations=-1 white");
