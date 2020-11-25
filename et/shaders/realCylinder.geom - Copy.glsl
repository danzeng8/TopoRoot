#version 420
//#extension GL_ARB_geometry_shader4 : enable

layout (lines_adjacency) in;
layout (triangle_strip, max_vertices = 4) out;


uniform mat4 ProjMat;
uniform mat4 CamMat;
//uniform mat4 model;
uniform vec3 EyePos;
//uniform int  radiusScale;



in  vertexData
{
	// vertices coord after transformation
	vec3 center;
    // vessel point radius
	float radius;
	// vert color
	vec3 color;
} vert[];



out vec3  vesselColor;
// parameters for ray intersection test
out geometryParameter
{
        vec3 p0; // v0 center --- bottom
        vec3 p1; // v1 center --- top
        vec3 p2; // v0 radius, v1 radius
        
        vec3 lastVert; // first point of the ajacency
        vec3 lastNorm;
        vec3 nextVert; // last point of the ajacency
        vec3 nextNorm;
} geo;


// generate three quads to represent a cylinder --- 4 triangles for each quad
struct vertData{

	vec3  center;
	vec3  up;
	vec3  down;
	vec3  upFront;
	vec3  downFront;
	vec3  upBack;      
	vec3  downBack;
	float radius;

} vert0, vert1;


void main()
{
    vert0.center = vert[1].center;
    vert0.radius = vert[1].radius;
    vert1.center = vert[2].center;
    vert1.radius = vert[2].radius;
	
	vec3 axis     = normalize( vert1.center - vert0.center ); // cylinder axis vector
        vec3 extDir   = normalize( cross( vert0.center - EyePos, -axis ) ); // generated vertices direction	
	vec3 frontDir = normalize( cross( extDir, -axis ) );
	
	float factor1 = 1.5;
	float factor2 = 1.5;
	// extend the center a little bit for inclined plane
	vert0.center = vert0.center - factor1*vert[2].radius*axis;
	vert1.center = vert1.center + factor1*vert[2].radius*axis;	
	
	// bottom
	vert0.up         = vert0.center + factor2*vert0.radius * extDir;
	vert0.down       = vert0.center - factor2*vert0.radius * extDir;
	vert0.upFront    = vert0.up     + factor2*vert0.radius * frontDir;
	vert0.upBack     = vert0.up     - factor2*vert0.radius * frontDir;	
	vert0.downFront  = vert0.down   + factor2*vert0.radius * frontDir;  
	vert0.downBack   = vert0.down   - factor2*vert0.radius * frontDir;   
	// top							  factor2
	vert1.up         = vert1.center + factor2*vert1.radius * extDir;
	vert1.down       = vert1.center - factor2*vert1.radius * extDir;
	vert1.upFront    = vert1.up     + factor2*vert1.radius * frontDir;
	vert1.upBack     = vert1.up     - factor2*vert1.radius * frontDir;	
	vert1.downFront  = vert1.down   + factor2*vert1.radius * frontDir;  
	vert1.downBack   = vert1.down   - factor2*vert1.radius * frontDir;
		
	/*********** generate the front quad *************/
	
        // cylinder parameters
		// geo.color 	= vert[0].color;
		
        geo.p0      = vert[1].center;
        geo.p1      = vert[2].center;
        geo.p2      = vec3(vert[1].radius, vert[2].radius, 0.0);         
        
        geo.lastVert = vert[0].center;
        geo.lastNorm = normalize( vert[1].center - vert[0].center );
        geo.nextVert = vert[3].center;
        geo.nextNorm = normalize( vert[2].center - vert[3].center );        
        
        // vert1 is the end we see cap(top), vert0 is the end we see curve(bottom) --- the end close to eye always shows the cap        
        float dis0 = distance( vert[1].center, EyePos );
        float dis1 = distance( vert[2].center, EyePos );
                	
        (dis0 > dis1) ?	
        (
                vesselColor = vert[0].color,
                gl_Position = ProjMat * CamMat * vec4( vert0.upFront, 1.0 ),
                EmitVertex(),                
                gl_Position = ProjMat * CamMat * vec4( vert0.downFront, 1.0 ),
                EmitVertex(),        
                vesselColor = vert[0].color,
                gl_Position = ProjMat * CamMat * vec4( vert1.upBack, 1.0 ),
                EmitVertex(), 
                gl_Position = ProjMat * CamMat * vec4( vert1.downBack, 1.0 ),
                EmitVertex(),        
                
                EndPrimitive() 
        )             :
        (
                vesselColor = vert[0].color,
                gl_Position = ProjMat * CamMat * vec4( vert0.upBack, 1.0 ),
                EmitVertex(), 
                gl_Position = ProjMat * CamMat * vec4( vert0.downBack, 1.0 ),
                EmitVertex(),         
                vesselColor = vert[0].color,
                gl_Position = ProjMat * CamMat * vec4( vert1.upFront, 1.0 ),
                EmitVertex(),                
                gl_Position = ProjMat * CamMat * vec4( vert1.downFront, 1.0 ),
                EmitVertex(),                  
                
                EndPrimitive()         
        )             ;                                      	
	

}
