#version 420

/*
#define VERTEX_COORD   0
#define TANGENT_COORD  1
#define RADUIS         2
#define COLOR		   3
*/

uniform mat4 ModelMat;
uniform float Radius;

in vec3 Position;
in vec3 Color;

/** real cylinder test **/
out  vertexData
{
	// for rasterize position
	vec3 center;	
	// length for calculate raduis in screen space
	float radius;
	// color info
	vec3 color;
} outData;

// render a cylinder like quad from a line
void main(void)
{

        /***** draw a real cylinder ******/
        
        // pass in the real position after transform into geometry shader
        vec4 temp       = ModelMat * vec4(Position, 1.0);
        temp            = temp / temp.w;
        outData.center  = temp.xyz;    
           
        outData.radius  = Radius;              
        
		outData.color = Color;
}











