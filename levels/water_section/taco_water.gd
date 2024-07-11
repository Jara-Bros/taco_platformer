extends CharacterBody2D


@export var SPEED = 50.0
const JUMP_VELOCITY = -20

var horizontal_direction
var vertical_direction


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	horizontal_direction = Input.get_axis("move_left", "move_right")
	vertical_direction = Input.get_axis("move_up", "move_down")
	# Handle jump.
	if horizontal_direction > 0:
		velocity.x = move_toward(velocity.x, horizontal_direction * SPEED, 10)
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
	
	if vertical_direction > 0:
		velocity.y = move_toward(velocity.y, vertical_direction * SPEED, 10)
	else:
		velocity.y = move_toward(velocity.y, 0, 10)


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
