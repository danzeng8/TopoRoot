#version 330

uniform mat4 ProjMat, CamMat, ModelMat;
uniform vec3 Color;

in vec3 Position;
in vec3 Normal;
//in vec3 Color;
in float Saliency;

out vec4 normal_ws;
out vec4 fragPos;
out vec3 vertColor;
out float vertSaliency;

void main(void)
{
	gl_Position =
		ProjMat * CamMat * ModelMat * vec4(Position, 1.0);
	fragPos = ModelMat * vec4(Position, 1.0);
	normal_ws = normalize(ModelMat * vec4(Normal, 0.0));
	vertColor = Color;
	vertSaliency = Saliency;
}