extends CharacterBody2D


@export var speed = 100.0
@export var jump_velocity = -300.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		animation_player.play("jump")

	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = jump_velocity / 1.5


	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	# Flip sprite
	if direction > 0:
		sprite_2d.flip_h = false
	elif direction < 0:
		sprite_2d.flip_h = true

	# Play animations
	if is_on_floor():
		if direction == 0:
			animation_player.play("idle")
		else:
			animation_player.play("walk")
	else:
		if velocity.y < 0:
			animation_player.play("jump")
		if velocity.y > 0:
			animation_player.play("idle")


	move_and_slide()
	
