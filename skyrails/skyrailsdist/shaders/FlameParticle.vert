//
// Modified vertex shader, originally for rendering a "confetti cannon"
// via a partcle system, now it's for creating flames.
//
// Author: It was, Randi Rost, but now, Yose Widjaja
//
// Copyright (c) 2003-2004: 3Dlabs, Inc., but has been modified by Yose.
//

uniform float Time;            // updated each frame by the application
 
attribute vec3  Velocity;      // initial velocity
attribute float StartTime;     // time at which particle is activated

varying vec4 Color;
 
void main(void)
{
    vec4  vert;
    float t = mod(Time - StartTime + 4.0, 4.0);

    vert    = gl_Vertex;
    vert.x += Velocity.x * sqrt(t) * 2.0;
    vert.z += Velocity.z * sqrt(t) * 2.0;
    vert.y += Velocity.y * t + 0.4 * t * t;
    Color   = gl_Color;
    Color[3] = 4.0 - t;
 
    gl_Position  = gl_ModelViewProjectionMatrix * vert;
}