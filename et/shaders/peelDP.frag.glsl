#version 330

uniform uint Peel;
uniform sampler2D DepthRefTex;

in float alpha;
in vec3 vertColor;

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
			/*gl_FragDepth = d_ref;
			fragColor = vec4(d_ref);*/
			discard;
		}
		gl_FragDepth = gl_FragCoord.z;
		fragColor = vec4(vertColor, alpha);
		//fragColor = vec4(gl_FragCoord.z);
		/*if (gl_FragCoord.z >= d_ref)
			discard;*/
	}
	else
	{
		fragColor = vec4(vertColor, alpha);
		gl_FragDepth = gl_FragCoord.z;
	}
}