#version 330

layout(triangles) in;
layout(triangle_strip, max_vertices = 3) out;

uniform vec2 ViewportDim;

in vec3 vertNormal[], vertLightDir[];
in vec3 vertColor[];
in float vertSaliency[];

noperspective out vec3 geomDist;
flat out vec3 geomNormal;
out vec3 geomColor;
out vec3 geomLightDir;
out float geomSaliency;

void main(void)
{
	geomNormal = normalize(
		vertNormal[0] + 
		vertNormal[1] + 
		vertNormal[2]
	);
	geomSaliency = (vertSaliency[0] + vertSaliency[1] + vertSaliency[2]) * 0.3;

	vec2 screenPos[3];
	for (int i = 0; i < 3; ++i)
	{
		screenPos[i] = 
			ViewportDim * gl_in[i].gl_Position.xy / 
			gl_in[i].gl_Position.w;
	}

	// storing screen space vector for oppo. edge of vert i
	vec2 tmpVec[3];
	for (int i = 0; i < 3; ++i)
	{
		tmpVec[i] = screenPos[(i+2)%3] - screenPos[(i+1)%3];
	}

	// used to mask out dist to neighb edge to 0 for vert i
	const vec3 edgeMask[3] = vec3[3](
		vec3(1.0, 0.0, 0.0),
		vec3(0.0, 1.0, 0.0),
		vec3(0.0, 0.0, 1.0)
		);
	for (int i = 0; i < 3; ++i)
	{
		// dist of i to its oppo. edge
		float dist = abs(
			tmpVec[(i+1) % 3].x * tmpVec[(i+2) % 3].y - 
			tmpVec[(i+1) % 3].y * tmpVec[(i+2) % 3].x
			) / length(tmpVec[i]);
		vec3 distVec = vec3(dist, dist, dist);

		// output position, dist to oppo. edge
		gl_Position = gl_in[i].gl_Position;
		geomLightDir = vertLightDir[i];
		geomDist = edgeMask[i] * distVec;
		geomColor = vertColor[i];
		EmitVertex();
	}

	EndPrimitive();
}