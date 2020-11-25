#version 330

/// DP transparency
uniform uint Peel;
uniform sampler2D DepthRefTex;

uniform uint UseAlpha /*= false*/; // regulate transparency
uniform uint EnableLighting = 0u;
uniform vec3 LightPosition;/* = vec3(10.0, 10.0, 7.0);*/
const float ambientFactor = 0.5;

in vec4 normal_ws;
in vec4 fragPos;
in vec3 vertColor;
in float vertSaliency;

out vec4 fragColor;
//out vec4 count; // OIT

void main(void)
{
    // use light direction from host, or over-ride it with custom light position
    vec3 lightpos = LightPosition.x == 9999999.0f ? LightPosition : LightPosition.xyz + vec3(-10.0, 10.0, 0.0);
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

	const vec3 eye = vec3(0.0, 0.0, 0.0);
	const int shiness = 5;
	const float specularIntensity = 0.3;
	const float diffuseIntensity = 0.7;

	vec4 diffuseColor = vec4(0.0, 0.0, 0.0, 0.0);
	vec4 specularColor = vec4(0.0, 0.0, 0.0, 0.0);
	vec4 ambientColor = vec4(0.0, 0.0, 0.0, 0.0);
	vec3 lightDir = normalize(lightpos - fragPos.xyz);
	
	float cos_theta = dot(normal_ws.xyz, lightDir);
	vec4 new_normal = normal_ws;
	cos_theta < 0.0 ? 
		(
		new_normal = -normal_ws, cos_theta = dot(new_normal.xyz, lightDir)
		) 
		: 
		1;
	
	// diffuse color
	float diffuseFactor = max(cos_theta, 0.0);
	diffuseFactor = max(diffuseFactor,
		max(dot(new_normal.xyz, lightDir), 0.0));
	fragColor = vec4(vertColor, 1.0);
	diffuseColor = fragColor * diffuseIntensity * diffuseFactor;
	
	// specular lighting
	vec3 rDir = normalize( reflect(-lightDir, new_normal.xyz) ); // reflect vector
	vec3 toEyeDir = normalize(eye - fragPos.xyz); // from frag to eye vector
	float specularFactor = max(0.0, dot(toEyeDir, rDir) );
	specularFactor = pow(specularFactor, shiness);
	specularColor = fragColor * specularIntensity * specularFactor;
	
	// ambient color
	ambientColor = fragColor * ambientFactor;
	
	gl_FragDepth = gl_FragCoord.z;
	// fragColor = fragColor * min((diffuse + ambientFactor), 0.99) * 0.001 + vec4(vertColor, vertSaliency + Alpha);
	fragColor = EnableLighting == 1u ? ambientColor + diffuseColor + specularColor : fragColor;
	fragColor.w = UseAlpha == 1u ? vertSaliency : 1.0f;
	//fragColor.w = vertSaliency;
	//fragColor.xyz *= fragColor.www;
	//vec4(vertColor * min((diffuse + ambientFactor), 0.99), vertSaliency + Alpha);

	/// OIT
	//count = vec4(1.0);
}