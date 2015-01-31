Skybox media copyright (c) 2005, Mark Aaron Alsip.  All rights reserved.


This skybox is being provided free to the amateur game developer community in hopes of answering the very common
question, "where can I get royalty-free media for my games?"  Non-commercial use in your games is OK, no need to
contact me. 

Commercial use by indie developers is almost certainly OK if you contact me first and let me know what 
you want to do with it.  My intent IS NOT to "bait and switch" anyone by getting the box into your game and then 
trying to charge for it.  Basically, I just want to make sure nobody packages all the boxes up and then tries to 
sell them as a collection on TurboSquid, or something like that.  

(I've received about a dozen commercial requests so far, and ALL have been OK'd.)

PROHIBITED: Placing the skyboxes for download on another web site, selling the skyboxes as 3D content, etc.  
If in doubt, contact me!

I'd love to hear how your using the boxes, if you do indeed use them, and I always appreciate feedback, good or bad:

Mark Aaron Alsip
marc@alsip.net
http://www.vaxwar.com		(game dev web site)
http://www.alsip.net		(personal web site)
P.O. Box 54538
Lexington, KY 40555
U.S.A.



For DarkBasic Professional users, here is the minimum code you will need to quickly load and use these
skyboxes in a simple scene.  Do this before the game loop that handles your camera movement.

  intBoxNum = 1000					` Change this if you've already got object #1000
  load object "cielo.x", intBoxNum			` Make sure textures are in smae folder!
  set object light intBoxNum, 0				` Lighting is already "baked" into the textures
  set object texture intBoxNum, 2, 1			` You'll get visible seams without this!
  scale object intBoxNum, 30000, 30000, 30000		` Box will be too small without this!
  position object intBoxNum, 0,0,0			` Center box in the scene		
  position camera 0,0,0					` Position camera INSIDE the box

 