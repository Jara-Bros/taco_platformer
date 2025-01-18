extends CharacterBody2D


const SPEED = 200.0

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:


	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	move_and_slide()


	if Input.is_action_just_pressed("move_left"):
		anim_sprite.play("walk_left")

	
	if Input.is_action_just_pressed("move_right"):
		anim_sprite.play("walk_right")


	if Input.is_action_just_released("move_left"):
		anim_sprite.play("idle_left")


	if Input.is_action_just_released("move_right"):
		anim_sprite.play("idle_right")
