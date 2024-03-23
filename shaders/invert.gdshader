shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	float scale = 0.8;
	vec4 color = textureLod(SCREEN_TEXTURE,SCREEN_UV,0.4).rgba;
	color.r = 1.0*scale - color.r;
	color.g = 1.0*scale - color.g;
	color.b = 1.0*scale - color.b;
	COLOR = color;
}
