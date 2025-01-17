shader_type canvas_item;
uniform float size = 2.1;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec2 uv = UV -0.5;
	uv.x *= size;
	uv.y *= 2.3;
	float d = length(uv);
	float r = 1.0;
	float c = 1.0;
	if (d<r) c=0.1;
	COLOR = vec4(vec3(c), 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
