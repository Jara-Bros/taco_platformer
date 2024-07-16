shader_type spatial;
uniform sampler2D noise;
uniform float height_scale = 0.75;
void vertex() {
	float height = texture(noise, VERTEX.xz / 2.0 ).x; //divide by the size of the PlaneMesh
VERTEX.y += height * height_scale;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
