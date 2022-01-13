// skeleton1 by G.Landini
// a skeletonisation algorithm, different from the one in ImageJ
// 8-connected
// 3 Dec 2003
// uses BinaryThin2_.class avaliable from www.dentistry.bham.ac.uk/landinig/
// assumes a white object on a black background

run("BinaryThin2 ", "kernel_a='1 1 1 2 1 2 0 0 0' kernel_b='1 2 1 2 1 2 0 0 0' rotations='rotate 45' iterations=-1 white");
