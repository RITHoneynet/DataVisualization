varying vec3 N;
varying vec3 v;
varying vec3 lightpos;
varying vec4 diffuse,ambient,specular;

void main (void)
{
vec3 L = normalize(lightpos - v); 
vec3 E = normalize(-v); // we are in Eye Coordinates, so EyePos is (0,0,0)
vec3 R = normalize(-reflect(L,N)); 

//calculate Ambient Term:

//calculate Diffuse Term:
vec4 Idiff = diffuse * max(dot(N,L), 0.0);

// calculate Specular Term:
vec4 Ispec = specular 
                  * pow(max(dot(R,E),0.0),0.3*gl_FrontMaterial.shininess);

// write Total Color:
vec4 totalcolor = ambient + Idiff + Ispec;
totalcolor[3] = (ambient[3] + diffuse[3])/2.0  + Ispec[3];
gl_FragColor = totalcolor;

}