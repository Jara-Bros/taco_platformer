extends CharacterBody2D

@export var jump_velocity : int
@export var speed : int
func burrito_movement(delta):
	
	# For walk and run speeds
	velocity.x += speed * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = jump_velocity / 2
