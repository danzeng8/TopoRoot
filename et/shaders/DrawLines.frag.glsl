#version 330

/// DP transparency
uniform uint Peel;
uniform sampler2D DepthRefTex;

uniform uint UseAlpha; // regulate transparency

in vec3 vertColor;
in float vertSaliency;

out vec4 fragColor;
//out vec4 count; // OIT

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

	gl_FragDepth = gl_FragCoord.z;
	fragColor = vec4(vertColor, UseAlpha == 1u ? vertSaliency : 1.0);

	// OIT
	//count = vec4(1.0);
}