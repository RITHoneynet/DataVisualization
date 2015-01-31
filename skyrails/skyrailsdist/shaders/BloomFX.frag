	uniform sampler2D therender;
   uniform sampler2D accum;
	
	void main()
	{
      vec4 s0 = texture2D(therender,gl_TexCoord[0].st);
      vec4 s1 = texture2D(therender,gl_TexCoord[0].st,1.0);
      vec4 s2 = texture2D(therender,gl_TexCoord[0].st,2.0);
      vec4 s3 = texture2D(therender,gl_TexCoord[0].st,3.0);
      vec4 s4 = texture2D(therender,gl_TexCoord[0].st,4.0);
      vec4 s5 = texture2D(therender,gl_TexCoord[0].st,5.0);
      vec4 s6 = texture2D(therender,gl_TexCoord[0].st,6.0);
      vec4 s7 = texture2D(therender,gl_TexCoord[0].st,7.0);
      //vec4 s8 = texture2D(therender,gl_TexCoord[0].st,8.0);
      
      gl_FragColor = max(max(max(s0,s1),max(s2,s3)), max(max(s4,s5), max(s6,s7)));
      
	}
