#version 330

uniform float Alpha; // regulate transparency

in vec3 vertColor;
in float vertSaliency;

out vec4 fragColor;

void main(void)
{
	fragColor = vec4(vertColor, vertSaliency + Alpha);
}