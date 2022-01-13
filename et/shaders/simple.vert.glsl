#version 330

in vec4 Vertex;
//in vec3 Color;

//out float alpha;
//out vec3 vertColor;
void main(void)
{
	gl_Position = vec4(Vertex.xyz, 1.0);
	//alpha = Vertex.w;
	//vertColor = Color;
}