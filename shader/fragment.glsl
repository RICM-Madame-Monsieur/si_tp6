// Version d'OpenGL
#version 150

in vec2 vert_texCoord;

in vec3 vert_normal;
in vec3 e;
in vec3 light_dir;
in vec3 view_dir;

out vec4 frag_color;

float pa  = 0.5;
float pd  = 0.5;
float ps  = 0.5;
int shiny = 64;
vec3 la  = vec3( 1.0,  1.0,  1.0);
vec3 ld  = vec3( 1.0,  0.5,  0.5);
vec3 ls  = vec3( 1);
vec3 l   = vec3( 4.0,  4.0, -3.0);

uniform sampler2D texSampler;

// Fonction appellee pour chaque fragment
void main()
{
  	vec3 r = normalize(reflect(l, vert_normal));

	vec3 ambient  = vec3(pa * la);
	vec3 diffuse  = vec3(pd * ld * max(dot(-normalize(vert_normal), normalize(l)), 0));
  	vec3 specular = vec3(ps * ls * pow(max(dot(r, e), 0), shiny));
  	
  	vec3 vert_color = vec3(ambient + diffuse + specular);

  	// Affectation de la couleur du fragment
	//frag_color = vec4(vert_color,1.0);

// TODO: récupérer la couleur correspondant à ce fragment dans la texture
  frag_color = texture2D( texSampler, vert_texCoord) * vec4(vert_color,1.0);

}
