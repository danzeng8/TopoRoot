#version 330

uniform float Alpha = 1.0; // regulate transparency
uniform vec3 LightPosition;/* = vec3(10.0, 10.0, 7.0);*/
const float ambient = 0.5;

in vec4 normal_ws;
in vec4 fragPos;
in vec3 vertColor;
in float vertSaliency;

out vec4 fragColor;

void main(void)
{
	fragColor = vec4(vertColor, 1.0);
	vec3 lightDir = normalize(LightPosition - fragPos.xyz);
	float cos_theta = dot(normal_ws.xyz, lightDir);
	cos_theta < 0.0 ? cos_theta = dot(-normal_ws.xyz, lightDir) : 1;
	float diffuse = max(cos_theta, 0.0);
	diffuse = max(diffuse,
		max(dot(normal_ws.xyz, lightDir), 0.0));

	fragColor = fragColor * min((diffuse + ambient), 0.99) * 0.001 + vec4(vertColor, vertSaliency + Alpha);
	//fragColor = vec4(vertColor, Alpha);
}