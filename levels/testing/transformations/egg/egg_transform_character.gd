extends CharacterBody2D


var speed = 800.0


func _physics_process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -1 * speed
		

	move_and_slide()
