class_name Player extends CharacterBody2D

signal AimingKick(aiming_direction)
var aim_kick_up : Vector2 = Vector2(0, -800)
var aim_kick_left : Vector2 = Vector2(-400, -300)
var aim_kick_right : Vector2 = Vector2(400, -300)
var pass_kick_left : Vector2 = Vector2(-400, 0)
var pass_kick_right : Vector2 = Vector2(400, 0)
@export var input_enabled:bool = true

@export var speed : int
@export var acceleration : int
@export var jump_velocity : int
@export var gravity : int
enum player_state {STILL,MOVING_LEFT,MOVING_RIGHT, IN_AIR, KICKING, AIMING}
var current_state = player_state.STILL
var prev_state

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var camera_2d: Camera2D = $Camera2D

var item = null

var direction
var player_facing

	
func _physics_process(delta: float) -> void:
	if not input_enabled:
		return
	
	direction = Input.get_axis("move_left", "move_right")


	# For walk and run speeds
	velocity.x += speed * delta

	if direction:
		if direction > 0:	
			change_state(player_state.MOVING_RIGHT)
		else:
			change_state(player_state.MOVING_LEFT)
		velocity.x = direction * speed
	else:
		change_state(player_state.STILL)
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
	
	# Add the gravity.
	if not is_on_floor_only():
		velocity.y += 1.5 * gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor_only():
		change_state(player_state.IN_AIR)
		velocity.y = jump_velocity

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor_only():
			velocity.y = jump_velocity

	# Handle action
	if Input.is_action_just_pressed("item"):
		prev_state = current_state
		current_state = player_state.KICKING
		animation_player.play("kick")
		if item != null:
			#animation_player.play("kick")
			item.kick()
			item = null
	
	# Flip sprite
	if direction > 0:
		player_facing = 1
		sprite_2d.flip_h = false
	elif direction < 0:
		player_facing = -1
		sprite_2d.flip_h = true
	
	
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			if current_state == player_state.KICKING:
				animation_player.play("kick")
			else:
				animation_player.play("idle")
		else:
			if current_state == player_state.KICKING:
				animation_player.play("kick")
			else:
				animation_player.play("walk")
	else:
		if velocity.y < 0:
			if current_state == player_state.KICKING:
				animation_player.play("kick")
			else:
				animation_player.play("jump")
		if velocity.y > 0:
			if current_state == player_state.KICKING:
				animation_player.play("kick")
			else:
				animation_player.play("idle")

func disable():
	input_enabled = false
	animation_player.play("idle")
	
func enable():
	input_enabled = true
	visible = true
	
func set_item(item_node):
	item = item_node
	
func get_state():
	return current_state 
func get_direction():
	return player_facing
	
func change_state(state):
	if current_state != player_state.KICKING:
		current_state = state
	


func _on_animation_player_animation_finished(anim_name):
	if current_state == player_state.KICKING:
		if prev_state == player_state.KICKING:
			current_state = player_state.STILL
		else:
			current_state = prev_state
	pass # Replace with function body.
