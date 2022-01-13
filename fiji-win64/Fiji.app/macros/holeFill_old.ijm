# @String input
# @String suffix
# @Integer threshold

// Add trailing slashes
//input=input+"\\";

// A final statement to confirm the task is complete...
print(input);
open(input);
print("Opened slices");
setThreshold(threshold, 255);
print("set threshold");
setOption("BlackBackground", true);
run("Convert to Mask", "method=Default background=Dark black");
run("Fill Holes", "stack");
print("filled holes");
run("Image Sequence... ", "format=PNG name=[] save=../../tmp/holefill/0000.png");
print("saved image sequence");
run("Quit");