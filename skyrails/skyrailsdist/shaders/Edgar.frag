	uniform sampler2D therender;
   
	
	void main()
	{
     
      //vec4 color = texture2D(therender,gl_TexCoord[0].st);
      //vec4 left = texture2D(therender,gl_TexCoord[0].st + vec2(0.0, -0.003));
      //vec4 up = texture2D(therender,gl_TexCoord[0].st + vec2(0.003, 0.0));
      //vec4 right = texture2D(therender,gl_TexCoord[0].st + vec2(0.00, 0.003));
      //vec4 down = texture2D(therender,gl_TexCoord[0].st + vec2(-0.003, 0.0));
      
      //color = (color * 4.0) - (left + up + right + down);
      
      //gl_FragColor = color;
      //float luminosity =((max(max(color[0], color[1]), color[2]) + min(min(color[0], color[1]), color[2]))/2.0);
      
		//gl_FragColor = vec4(luminosity, luminosity, luminosity, 1.0);
      vec4 color = texture2D(therender,gl_TexCoord[0].st);
      gl_FragColor= vec4( 1.0 - color.r, 1.0 - color.g, 1.0 - color.b, color.a ); 
	}