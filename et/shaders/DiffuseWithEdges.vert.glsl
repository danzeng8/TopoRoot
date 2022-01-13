#version 330

uniform vec3 LightPosition;
uniform mat4 ProjMat, CamMat, ModelMat;

in vec3 Position;
in vec3 Normal;
in vec3 Color;
in float Saliency;

out vec3 vertNormal;
out vec3 vertLightDir;
out vec3 vertColor;
out float vertSaliency;

void main(void)
{
	gl_Position = ModelMat * vec4(Position, 1.0);
	vertNormal = (ModelMat * vec4(Normal, 0.0)).xyz;
	vertLightDir = LightPosition - gl_Position.xyz;
	vertColor = Color;
	vertSaliency = Saliency;
	
	gl_Position = ProjMat * CamMat * gl_Position;
}