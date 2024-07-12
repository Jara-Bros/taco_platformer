extends CharacterBody2D


@export var HORIZONTAL_SPEED = 150.0
@onready var sprite_2d : Sprite2D = $Sprite2D

const JUMP_VELOCITY = -20

var horizontal_direction

func _ready():
	horizontal_direction = 1

func _physics_process(delta):
	# Add the gravity.
	#velocity += Vector2(0, 600) * delta
	
	if Input.is_action_just_pressed("move_left"):
		horizontal_direction = -1
	if Input.is_action_just_pressed("move_right"):
		horizontal_direction = 1
	velocity.x = move_toward(velocity.x, horizontal_direction * HORIZONTAL_SPEED, 10)
	
	if horizontal_direction > 0:
		sprite_2d.flip_h = false
	elif horizontal_direction < 0:
		sprite_2d.flip_h = true
	
		

	move_and_slide()
