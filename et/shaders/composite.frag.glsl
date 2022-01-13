#version 400

uniform vec2 ViewportSizes; // window w, h
//uniform uint SimpleDraw;
uniform sampler2D BGTex;
uniform sampler2D AccumTex;
uniform sampler2D CountTex;

//in float alpha;
//in vec3 vertColor;

out vec4 fragColor;

void main(void)
{
	vec2 tex_coord = vec2(
		float(gl_FragCoord.x) / ViewportSizes.x,
		float(gl_FragCoord.y) / ViewportSizes.y
		);

	/*
	vec4 accum = texelFetch(
		AccumTex,
		ivec2(gl_FragCoord.xy), 0
		);
	float n = texelFetch(CountTex, ivec2(gl_FragCoord.xy), 0).r;
	vec4 bg_color = texelFetch(
		BGTex,
		ivec2(gl_FragCoord.xy), 0
		);
		*/
	vec4 accum = texture(AccumTex, tex_coord);
	float n = texture(CountTex, tex_coord).r;
	vec4 bg_color = texture(BGTex, tex_coord);

	if (n == 0.0)
	{
		fragColor = bg_color;
	}
	else
	{
		float w = pow(max(0.0, 1.0 - accum.a / n), n);
		fragColor = vec4(
			accum.rgb / max(accum.a, 0.01) * (1.0 - w) 
			+ bg_color.rgb * w,
			1.0
			);
	}

	//fragColor = vec4(accum.a + n * 0.000000001);
	//fragColor = vec4(accum.r * 0.000000001 + n / 3.0);
	//fragColor = vec4(bg_color.rgb, (accum.r + n) * 0.000000001);
	//fragColor = vec4(vec3(n/10.0), (bg_color.r + accum.r)* 0.000000001);
	//fragColor = vec4(accum.aaa, (bg_color.r + n)* 0.000000001);
	//fragColor = vec4(tex_coord, 0.0, (accum.a + bg_color.r + n)* 0.000000001);
	/*if (ViewportSizes.x < 10.0)
		fragColor = vec4(1.0, 0, 0, 1);
	else
		fragColor = vec4(1.0, ViewportSizes.y / ViewportSizes.x, 0.0, (accum.a + bg_color.r + n)* 0.000000001);*/

	/*if (n == 0)
	fragColor = vec4(0.0, 0.0, 1.0, (bg_color.r + accum.r)* 0.000000001);
	else if (n == 1)
	fragColor = vec4(1.0, 0.0, 0.0, (bg_color.r + accum.r)* 0.000000001);
	else
	fragColor = vec4(0.0, 1.0, 0.0, (bg_color.r + accum.r)* 0.000000001);*/
}