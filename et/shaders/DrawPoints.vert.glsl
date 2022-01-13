#version 330

uniform mat4 ProjMat, CamMat, ModelMat;
uniform float PointSize;

in vec3 Position;
in vec3 Color;

out vec3 vertColor;

void main(void)
{
	gl_Position =
		ProjMat * CamMat * ModelMat * vec4(Position, 1.0);
	gl_PointSize = PointSize; // * gl_Position.w / gl_Position.z;
	
	vertColor = Color;
}