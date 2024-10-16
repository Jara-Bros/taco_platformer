extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var input_enabled:bool = true
@onready var camera_2d: Camera2D = $Camera2D

func _physics_process(delta):
	if not input_enabled:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction > 0:
		$Sprite2D.flip_h = false
	elif direction < 0:
		$Sprite2D.flip_h = true

	move_and_slide()


func disable():
	input_enabled = false
	
func enable():
	input_enabled = true
	visible = true
	
