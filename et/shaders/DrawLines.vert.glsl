#version 330

uniform mat4 ProjMat, CamMat, ModelMat;
//uniform float PointSize;

in vec3 Position;
in vec3 Color;
in float Saliency;

out vec3 vertColor;
out float vertSaliency;

void main(void)
{
	gl_Position =
		ProjMat * CamMat * ModelMat * vec4(Position, 1.0);
	
	vertColor = Color;
	vertSaliency = Saliency;
}