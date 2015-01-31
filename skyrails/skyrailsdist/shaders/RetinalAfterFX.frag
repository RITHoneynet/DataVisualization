	uniform sampler2D therender;
   uniform sampler2D accum;
   uniform float decay;
	
	void main()
	{
		vec4 accumcolor = texture2D(accum,gl_TexCoord[0].st, 2.0);
      vec4 newcolor = texture2D(therender,gl_TexCoord[0].st);
      
      //float totalrel = (accumcolor[0] + accumcolor[1] + accumcolor[2]) / 3.0;
      float luminosity = (max(max(accumcolor[0], accumcolor[1]), accumcolor[2]) + min(min(accumcolor[0], accumcolor[1]), accumcolor[2]))/2.0;
      //float lumchange;
      
      //if(luminosity > 0.9)
         //lumchange = mix(luminosity / 5.0, 0.01, (luminosity - 0.9) * 10.0);
      //else
         //lumchange = luminosity / 5.0;
      
      //accumcolor[0] = accumcolor[0] - lumchange;
      //accumcolor[1] = accumcolor[1] - lumchange;
      //accumcolor[2] = accumcolor[2] - lumchange;
      accumcolor[0] = accumcolor[0] * decay;
      accumcolor[1] = accumcolor[1] * decay;
      accumcolor[2] = accumcolor[2] * decay;
      
      vec4 color = vec4(max(accumcolor[0], newcolor[0]),
                        max(accumcolor[1], newcolor[1]),
                        max(accumcolor[2], newcolor[2]),
                        1.0);
                        
      //vec4 color = vec4(min(accumcolor[0] + newcolor[0],1.0),
                        //min(accumcolor[1] + newcolor[1],1.0),
                        //min(accumcolor[2] + newcolor[2],1.0),
                        //1.0);

      //color[0] = 1.0;
      //color[1] = 0.0;
      //color[2] = 0.0;
      
      //color[0] = color[0] * color[0] * 0.98;
      //color[1] = color[1] * color[1] * 0.98;
      //color[2] = color[2] * color[2] * 0.98;
      
		gl_FragColor = color;
	}
