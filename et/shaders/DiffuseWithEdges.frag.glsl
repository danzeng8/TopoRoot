#version 330

/// DP transparency
uniform uint Peel;
uniform sampler2D DepthRefTex;

uniform float EdgeWidth;
uniform vec3 EdgeColor; /* = vec3(0.0, 0.0, 0.0);*/
uniform bool UseAlpha; // regulate transparency

noperspective in vec3 geomDist;
flat in vec3 geomNormal;
//const vec3 geomColor = vec3(1.0, 0.2, 0.2);
in vec3 geomColor;
in vec3 geomLightDir;
in float geomSaliency;

out vec4 fragColor;

void main(void)
{
	if (Peel == 1u)
	{
		float d_ref = texelFetch(DepthRefTex, ivec2(gl_FragCoord.xy), 0).r;
		/// only consider fragments *before* the reference depth value, or the void
		if ( d_ref > 0.0 && gl_FragCoord.z >= d_ref)
		{
			// bring output depth to the same level as the ref depth
			// then copy cur. background color thru to output color
			discard;
		}
	}

	float minDist = min(
		min(geomDist.x, geomDist.y), 
		geomDist.z
		);
	float edgeAlpha = exp2(-pow(minDist / EdgeWidth, 2.0));
	const float ambient = 0.8;
	float diffuse = max( dot(
		normalize(geomNormal), 
		normalize(geomLightDir)
		), 0.0);

	// to counter-act lighting effect, multiply lighting term by a small number.
	// can't simply delete. will cause shader compile error.
	vec3 faceColor = geomColor * (diffuse + ambient) * 0.0001 + geomColor; 
	
	fragColor = vec4(mix(faceColor, EdgeColor, edgeAlpha), UseAlpha ? geomSaliency : 1.0);
	gl_FragDepth = gl_FragCoord.z;
}