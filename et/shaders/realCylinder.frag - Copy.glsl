#version 420

uniform float Znear;
uniform float Zfar;

uniform vec3 W;
uniform vec3 U;
uniform vec3 V;
uniform vec2 Screen;
uniform vec3 EyePos;

in vec3  vesselColor;
// parameters for ray intersection test
in geometryParameter
{
	vec3 p0;
	vec3 p1;
	vec3 p2;       

	vec3 lastVert;
	vec3 lastNorm;
	vec3 nextVert;
	vec3 nextNorm;
} geo;

//layout( depth_unchanged )out float gl_FragDepth;

out vec4 fragData_Color;

// ligth parameters
struct Light{

	vec3  pos;
	vec3  intense;
	vec3  ambient;

} light;

// Intersect the cylinder
void CylinderIntersection(in vec3 rayDir, out vec3 cNormal, out vec3 hitP, out float t, out int discardFlag)
{
	// generate cylinder space
	vec3 axis    = geo.p1 - geo.p0; // p0 is the origin for the cylinder space
	vec3 vector  = cross( axis, vec3(1.0, 0.0, 0.0) );
	vector       = length(vector) > 0.01 ? vector : cross( axis, vec3(0.0, 1.0, 0.0) );
	vec3 uVec    = normalize( cross(axis, vector) );
	vec3 vVec    = normalize( cross(axis, uVec) );
	axis         = normalize( axis );
	float height = distance(geo.p1, geo.p0);
	// get the eye coordinate and the ray direction value in the cylinder space
	vec3 temp = EyePos - geo.p0;
	vec3 orig = vec3( dot(temp, uVec),   dot(temp, vVec),   dot(temp, axis) );
	vec3 dir  = vec3( dot(rayDir, uVec), dot(rayDir, vVec), dot(rayDir, axis) );
	// find the location on the cylinder through ray intersection     
	float temp_a = (geo.p2.y - geo.p2.x)*(geo.p2.y - geo.p2.x)/(height*height);
	float temp_b = 2.0*geo.p2.x*(geo.p2.y - geo.p2.x)/height;
	float temp_c = geo.p2.x*geo.p2.x;
	float a = dir.x*dir.x + dir.y*dir.y - dir.z*dir.z*temp_a; // if the view ray is parallel with the axis, then a = 0
	float b = 2.0*( orig.x*dir.x + orig.y*dir.y - temp_a*orig.z*dir.z) - temp_b*dir.z;
	float c = orig.x*orig.x + orig.y*orig.y - temp_a*orig.z*orig.z - temp_b*orig.z - temp_c;
	float d = b*b - 4.0*a*c;

	discardFlag = d < 1e-4 ? 1 : 0; // to see if we get intersection on the cylinder

	d = d < 1e-4 ? 0.0 : sqrt(d);
	a = 2.0*a;

	float t1 = (-b + d)/a;               // hit point on the body
	float t2 = (-b - d)/a;               // hit point on the body
	float t3 = (-orig.z)/dir.z;          // hit point on the bottom
	float t4 = (height - orig.z)/dir.z;  // hit point on the top

	float d3 = length( (orig+t3*dir).xy );
	float d4 = length( (orig+t4*dir).xy );         
	float z1 = orig.z + t1*dir.z;
	float z2 = orig.z + t2*dir.z;

	discardFlag = ( (z1>height || z1<0) && (z2>height || z2<0) && d3 > geo.p2.x && d4 > geo.p2.y ) ? 1 : discardFlag;
	t = 1000000000.0;
	// find the closet hit on the platform body
	t = (t1 > 0 && t1 < t && z1 < height && z1 > 0) ? t1 : t;               
	t = (t2 > 0 && t2 < t && z2 < height && z2 > 0) ? t2 : t;        
	t = (t3 > 0 && t3 < t && d3 < geo.p2.x)         ? t3 : t; // if we comment out this line, the platform will miss the bottom
	t = (t4 > 0 && t4 < t && d4 < geo.p2.y)         ? t4 : t; // if we comment out this line, the platform will miss the top

	vec3 hitP_world = EyePos + t*rayDir; // get the hit point in the world space
	vec3 hitP_cylin = orig + t*dir;            // get the hit point in the cylinder space 

	// compute the normal of platform body                             
	vec3 tip = geo.p2.x > geo.p2.y ? (geo.p0 + (height*geo.p2.x / (geo.p2.x - geo.p2.y))*axis) : (geo.p1 - (height*geo.p2.y / (geo.p2.y - geo.p2.x))*axis);        
	vec3 tempNormal = geo.p2.x > geo.p2.y ? ( normalize( dot( normalize(tip - hitP_world), (geo.p1 - hitP_world) )*normalize(tip - hitP_world) + hitP_world - geo.p1 ) ) : 
		( normalize( dot( normalize(tip - hitP_world), (geo.p0 - hitP_world) )*normalize(tip - hitP_world) + hitP_world - geo.p0 ) ) ;
	// if the trancated cone degenerate to a cylinder, we get the normal in the cylinder way
	tempNormal = abs( geo.p2.x - geo.p2.y ) < 1e-3f ? normalize( hitP_world-geo.p0 - dot(hitP_world-geo.p0, axis)*axis ) : tempNormal;        
	// find the normal of the hit point --- the hit point can be on the top lid, bottom lid or on the body        
	cNormal = axis;        
	cNormal = ( hitP_cylin.z > 1e-9f && hitP_cylin.z + 1e-9f < height ) ? tempNormal : cNormal;     
	cNormal = ( hitP_cylin.z < 1e-9f )                                  ? -axis      : cNormal;     

	hitP = hitP_world;   

	discardFlag = ( dot(hitP-geo.lastVert, geo.lastNorm) < 0 || dot(hitP-geo.nextVert, geo.nextNorm) < 0 ) ? 1 : discardFlag; 

}


void SphereIntersection( in vec3 rayDir, out vec3 cNormal, out vec3 hitP, out float t, out int discardFlag )
{
	vec3 EO = geo.p1 - EyePos;
	float v = dot(EO, rayDir);
	float d = geo.p2.y*geo.p2.y - ( dot(EO,EO) - v*v);

	// to see if we intersect with the sphere
	discardFlag = (d >= 1e-9) ? 0 : 1;
	t = v - sqrt(d);        

	hitP = EyePos + t*rayDir;
	cNormal = normalize(EyePos + t*rayDir - geo.p1);

	// discardFlag = ( dot(hitP - geo.p1, geo.p1-geo.p0) < 0 || dot(hitP - geo.p1, geo.nextNorm) < 0 || distance(geo.nextVert, geo.p1) < 1e-4f) ? 1 : discardFlag;        
}

void SphereIntersection2( in vec3 rayDir, out vec3 cNormal, out vec3 hitP, out float t, out int discardFlag )
{
	vec3 EO = geo.p0 - EyePos;
	float v = dot(EO, rayDir);
	float d = geo.p2.y*geo.p2.y - ( dot(EO,EO) - v*v);

	// to see if we intersect with the sphere
	discardFlag = (d >= 1e-9) ? 0 : 1;
	t = v - sqrt(d);        

	hitP = EyePos + t*rayDir;
	cNormal = normalize(EyePos + t*rayDir - geo.p0);

	// discardFlag = ( dot(hitP - geo.p1, geo.p1-geo.p0) < 0 || dot(hitP - geo.p1, geo.nextNorm) < 0 || distance(geo.nextVert, geo.p1) < 1e-4f) ? 1 : discardFlag;        
}

void main()
{
	// put the light at eye location
	light.pos     = EyePos;
	light.intense = vec3(1.0, 1.0, 1.0);
	light.ambient = 0.2 * vesselColor;

	// calculate the direction of the intersection ray based on the Screen coordinate
	vec2  d0         = ( vec2( gl_FragCoord.x-0.5, gl_FragCoord.y-0.5) / Screen ) * 2.0f - 1.0f;
	vec3  rayDir     = normalize( d0.x*U + d0.y*V + W );
	float t_cylinder = 10000000.0;
	float t_sphere   = 10000000.0;
	float t_sphere2   = 10000000.0;

	// if we need to discard the fragment due to its corresponding location on the cylinder
	int  discardFlagCylinder = 0;
	int  discardFlagSphere   = 0;
	int  discardFlagSphere2   = 0;

	// surface normal and the hit point on the cylinder
	vec3 normal_cylinder, hitP_cylinder, normal_sphere, hitP_sphere;    
	vec3 normal_sphere2, hitP_sphere2;  

	/*************** cylinder intersection *****************/       
	CylinderIntersection( rayDir, normal_cylinder, hitP_cylinder, t_cylinder, discardFlagCylinder ); 
	SphereIntersection( rayDir, normal_sphere, hitP_sphere,  t_sphere, discardFlagSphere);
	SphereIntersection2( rayDir, normal_sphere2, hitP_sphere2,  t_sphere2, discardFlagSphere2);

	// if the point is not on the cylinder or the sphere, we discard the fragment
	//if( discardFlagCylinder != 0 )        
	if( discardFlagCylinder != 0 && discardFlagSphere != 0 && discardFlagSphere2 != 0 )	
		discard;	

	// the final normal, hit point and ray length
	vec3 cNormal, hitP;
	float t;	
	// to see if we hit the sphere or the truncated cone in the end
	( t_cylinder < t_sphere && discardFlagCylinder == 0 || discardFlagSphere != 0 ) ?
		( t = t_cylinder, cNormal = normal_cylinder, hitP = hitP_cylinder ) :
	( t = t_sphere, cNormal = normal_sphere, hitP = hitP_sphere );

	/*( t < t_sphere2 && discardFlagCylinder == 0 || discardFlagSphere2 != 0 ) ?
		( t = t, cNormal = cNormal, hitP = hitP ) :
	( t = t_sphere2, cNormal = normal_sphere2, hitP = hitP_sphere2 );*/

	// compute the surface lambertian color	     
	vec3 lightDir   = normalize(light.pos - hitP); // light direction	        	
	vec3 cColor  = light.intense * vesselColor * max( 0.0, dot(cNormal, lightDir) ) + light.ambient;	      

	//  compute the "real cylinder depth"	        
	float realNormDepth = Zfar*(t-Znear) / (t*(Zfar-Znear));  

	// shade the cylinder body color
	fragData_Color = realNormDepth == realNormDepth ? vec4( cColor, 1.0 ) : vec4( cColor, 1.0 );

	// write in the "real" depth
	gl_FragDepth = realNormDepth;

	//fragData_Color = vec4(vesselColor, 1.0);
}