# @String input
# @String output
# @String step
# @String widthIn
# @String heightIn
# @String slicesIn
// Add trailing slashes
//input=input+"\\";

print(1/step);
var rate=1/step;
run("Raw...", "open="+input+" image=[16-bit Signed] width="+widthIn+" height="+heightIn+" number="+slicesIn+" little-endian");
run("Scale...", "x="+rate+" y="+rate+" z="+rate+" interpolation=Bilinear average process create");
run("8-bit");
run("Image Sequence... ", "format=PNG name=[] save="+output+"");
print("saved image sequence");
run("Quit");