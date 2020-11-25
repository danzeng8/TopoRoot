// PruneAll by G.Landini
// a pruning algorithm, different from the one in ImageJ
// prunes all branches of a skeleton leavin only the closed loops
// 8-connected
// 4 Dec 2003
// uses BinaryThin_.class avaliable from www.dentistry.bham.ac.uk/landinig
// assumes a white object on a black background


run("BinaryThin ", "kernel_a='0 2 2 0 1 0 0 0 0'  rotations='rotate 45' iterations=-1 white");
