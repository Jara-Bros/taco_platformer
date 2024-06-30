extends CharacterBody2D

signal AimingKick(aiming_direction)
var pass_kick_left : Vector2 = Vector2(-400, 0)
var pass_kick_right : Vector2 = Vector2(400, 0)
@export var input_enabled:bool = true

@export var speed : int
@export var acceleration : int
@export var jump_velocity : int
@export var gravity : int = 1250
var item = null
enum player_direction {LEFT,RIGHT}
var current_direction = player_direction.RIGHT
enum player_state {MOVING, KICKING, AIMING}
var current_state = player_state.MOVING

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer



func taco_movement(delta):
	ItemManager.set_player_position(position)
	if not input_enabled:
		return
	
	var direction = Input.get_axis("move_left", "move_right")


	# For walk and run speeds
	velocity.x += speed * delta

	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if current_state == player_state.MOVING:
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
	if Input.is_action_just_released("item") and $AimingTimer.is_stopped() == false and current_state != player_state.AIMING:
		current_state = player_state.KICKING
		do_item_action()
	
	# Flip sprite
	if direction > 0:
		sprite_2d.flip_h = false
	elif direction < 0:
		sprite_2d.flip_h = true
	
	# Play animations
	if current_state == player_state.MOVING:
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
	elif current_state == player_state.AIMING:
		animation_player.play("aim")
	elif current_state == player_state.KICKING:
		animation_player.play("kick")
		
		
func _input(event):
	if current_state == player_state.AIMING and Input.is_action_just_released("item"):
		var aim_kick : Vector2 = Vector2(0, -800)
		AimingKick.emit(aim_kick)

func disable():
	input_enabled = false
	animation_player.play("idle")
	
func enable():
	input_enabled = true
	visible = true
	
func set_item(item_node):
	item = item_node
	
func do_item_action():
	if item != null:
		if current_direction == player_direction.LEFT:
			item.action(animation_player, pass_kick_left, "kick")
		else:
			item.action(animation_player, pass_kick_right, "kick")
		item = null
	await get_tree().create_timer(0.4).timeout
	current_state = player_state.MOVING

func aim():
	await AimingKick
	current_state = player_state.KICKING
	await get_tree().create_timer(0.4).timeout
	current_state = player_state.MOVING

func _on_aiming_timer_timeout():
	if Input.is_action_pressed("item") and item != null:
		current_state = player_state.AIMING
		aim()

func _on_aiming_kick(aiming_direction):
	item.action(animation_player, aiming_direction, "aim_kick")
