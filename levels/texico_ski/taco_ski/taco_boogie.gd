extends CharacterBody2D

var direction

var speed = 2.5
enum state {GROUND, AIR}
var current_state
var in_animation = false
var trick_degree = 0.05
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = state.GROUND
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = Input.get_axis("move_left", "move_right")
	if current_state == state.GROUND:
		if direction:
			position += direction * Vector2(speed,-speed)
	else:
		# in air
		if in_animation == false:
			if direction:
				rotation += direction * trick_degree
			pass
	move_and_slide()
	
func to_air():
	current_state = state.AIR
