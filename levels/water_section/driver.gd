extends CharacterBody3D


const SPEED = 150.0
@onready var sprite_3d : Sprite3D = $Sprite3D

func _physics_process(delta):
	
	
	if Input.is_action_pressed("move_left"):
		velocity.x = SPEED * delta * -1
		sprite_3d.rotation.z = -25
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED * delta * 1
		sprite_3d.rotation.z = 25
		
		
	if Input.is_action_pressed("item"):
		velocity.z = -1 * SPEED * delta

	
	move_and_slide()
