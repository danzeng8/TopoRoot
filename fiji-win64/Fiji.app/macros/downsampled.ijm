# @String input
# @String output
# @String step
// Add trailing slashes
//input=input+"\\";

print(1/step);
var rate=1/step;
open(input);
print("Opened slices");
run("Scale...", "x="+rate+" y="+rate+" z="+rate+" interpolation=Bilinear average process create");
run("Image Sequence... ", "format=PNG name=[] save="+output+"");
print("saved image sequence");
run("Quit");