varying vec3 N;
varying vec3 v;
varying vec3 lightpos;
varying vec4 diffuse,ambient, specular;

void main(void)
{
   v = vec3(gl_ModelViewMatrix * gl_Vertex);
   N = normalize(gl_NormalMatrix * gl_Normal);
   lightpos = vec3(gl_LightSource[0].position.xyz);
   diffuse = gl_FrontMaterial.diffuse * gl_LightSource[0].diffuse;
   ambient = gl_FrontMaterial.ambient * gl_LightSource[0].ambient;
   specular = gl_FrontMaterial.specular * gl_LightSource[0].specular;
   gl_Position = ftransform();
}