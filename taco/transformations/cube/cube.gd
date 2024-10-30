extends CharacterBody2D


@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 150.0
const JUMP_VELOCITY = 0.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction == -1:
		velocity.x = direction * SPEED
		sprite.flip_h = true
	elif direction == 1:
		velocity.x = direction * SPEED
		sprite.flip_h = false
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
