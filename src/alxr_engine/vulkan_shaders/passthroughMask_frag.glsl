#version 460
#ifdef ENABLE_ARB_INCLUDE_EXT
    #extension GL_ARB_shading_language_include : require
#else
    // required by glslangValidator
    #extension GL_GOOGLE_include_directive : require
#endif
#pragma fragment

// TODO: Make this into a specialization constant.
//const vec3 key_color = vec3(0.0001, 0.15, 0.0001);
//const vec3 key_color2 = vec3(0.12, 0.999, 0.12);

#include "common/baseVideoFrag.glsl"

layout(location = 0) out vec4 FragColor;

void main()
{
    vec4 color = SampleVideoTexture();
    //color.a = (all(greaterThan(color.rgb, key_color)) && all(lessThan(color.rgb, key_color2))) ? 0.01f : 1.0f; 
    color.a = ((color.g>(color.r*1.125)) && (color.g>(color.b*1.125)) && ((color.r<0.5) || (color.b<0.5) )) ? 0.0001f : 1.0f; 
    FragColor = color;
}
