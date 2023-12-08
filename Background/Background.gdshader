shader_type canvas_item;
uniform  vec2 tileFactor = vec2(5.0,5.0);
uniform float aspect_ratio = 0.5;
uniform vec2 direction= vec2(0,1);
uniform float speed = 1;
void fragment() {
	vec2 tile_uvs = UV * tileFactor;
	tile_uvs.y *= aspect_ratio;
	
	vec2 waves_uv_offset;
	waves_uv_offset.x = direction.x *TIME * speed;
	waves_uv_offset.y = direction.y * TIME  * speed;
	//COLOR = vec4(tile_uvs,0,1);
	
	COLOR = texture(TEXTURE,tile_uvs + waves_uv_offset);
	// Place fragment code here.
}
