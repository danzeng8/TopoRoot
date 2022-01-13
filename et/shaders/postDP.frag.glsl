#version 330

uniform uint CompositeStage;
uniform sampler2D DepthRefTex;
uniform sampler2D DepthFGTex;
uniform sampler2D FGColorTex;
uniform sampler2D BGColorTex;
//uniform sampler2D CompositeColorTex;

in float alpha;
in vec3 vertColor;

out vec4 fragColor;

void main(void)
{
	
	if (CompositeStage == 1u)
	{
		/* 
		output depth after composition of ref. and fg depth 
		(composite_depth_tex needs be attached to FBO) 
		*/

		float d_ref = texelFetch(DepthRefTex, ivec2(gl_FragCoord.xy), 0).r;
		float d_fg = texelFetch(DepthFGTex, ivec2(gl_FragCoord.xy), 0).r;
		
		float d_out = (d_ref == 0.0 || d_fg == 0.0) ? max(d_ref, d_fg) : min(d_ref, d_fg);
		gl_FragDepth = d_out;
		fragColor = vec4(d_out);
		//fragColor = vec4(gl_FragCoord.z);
		/*if (gl_FragCoord.z >= d_ref)
		discard;*/
	}
	else // CompositeStage == 2
	{
		/* 
		output composite color to CompositeColorTex 
		(composite_tex needs be attached to FBO)
		*/
		float d_fg = texelFetch(DepthFGTex, ivec2(gl_FragCoord.xy), 0).r;
		vec4 fg_color = texelFetch(FGColorTex, ivec2(gl_FragCoord.xy), 0);
		vec4 bg_color = texelFetch(BGColorTex, ivec2(gl_FragCoord.xy), 0);
		//fragColor = vec4( vec3(d_fg), fg_color.r);
		gl_FragDepth = gl_FragCoord.z;
		fragColor = 
			vec4(
			fg_color.rgb * fg_color.a + bg_color.rgb * (1.0-fg_color.a),
			1.0);
		/*fragColor = vec4(bg_color.rgb, fragColor.r);*/
	}
}