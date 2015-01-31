uniform sampler2D therender;

void main(void) 
{
    gl_TexCoord[0] = gl_MultiTexCoord0;
    gl_Position    = ftransform();
}