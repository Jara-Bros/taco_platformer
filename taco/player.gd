class_name Player extends CharacterBody2D

signal AimingKick


@export var input_enabled:bool = true

@export var speed : int
@export var acceleration : int
@export var jump_velocity : int
@export var gravity : int = 1250
var item = null


enum player_state {MOVING, KICKING, AIMING}
var current_state = player_state.MOVING

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer

func _physics_process(delta: float) -> void:
	if not input_enabled:
		return
	
	var direction = Input.get_axis("move_left", "move_right")


	# For walk and run speeds
	velocity.x += speed * delta

	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += 1.5 * gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if current_state == player_state.MOVING:
			velocity.y = jump_velocity
	
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = jump_velocity / 2
		
		
	# Handle action
	if Input.is_action_just_pressed("item"):
		if current_state == player_state.MOVING:
			$AimingTimer.start()
	if Input.is_action_just_released("item") and $AimingTimer.is_stopped() == false:
		do_item_action()
	
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

func _input(event):
	if event.is_action_pressed("item") and current_state == player_state.AIMING:
		AimingKick.emit()

func disable():
	input_enabled = false
	animation_player.play("idle")
	
func enable():
	input_enabled = true
	visible = true
	
func set_item(item_node):
	item = item_node
	
func do_item_action():
	current_state = player_state.KICKING
	if item != null:
		item.action(animation_player, position)
		item = null

func aim():
	current_state = player_state.AIMING
	animation_player.play("fall")
	await AimingKick
	# now trigger 


func _on_aiming_timer_timeout():
	if Input.is_action_just_pressed("item"):
		pass
	pass # Replace with function body.


func _on_aiming_kick():
	pass # Replace with function body.
