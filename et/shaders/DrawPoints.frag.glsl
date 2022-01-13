#version 330

in vec3 vertColor;

out vec4 fragColor;

void main(void)
{
	//fragColor = vec4(0.6, 0.3, 0.3, 1.0);
	fragColor = vec4(vertColor, 1.0);
}