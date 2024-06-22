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
@export var gravity : int = 1250
var item = null
enum player_direction {LEFT,RIGHT}
var current_direction = player_direction.RIGHT


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
	if current_state == player_state.AIMING and Input.is_action_just_pressed("item"):
		if event.is_action_pressed("aim_up"):
			AimingKick.emit("aim_up")
		elif event.is_action_pressed("aim_left"):
			AimingKick.emit("aim_left")
		elif event.is_action_pressed("aim_right"):
			AimingKick.emit("aim_right")

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
		if current_direction == player_direction.LEFT:
			item.action(animation_player, pass_kick_left, "kick")
		else:
			item.action(animation_player, pass_kick_right, "kick")
		item = null

func aim():
	print("made it to aim")
	current_state = player_state.AIMING
	animation_player.play("aim")
	await AimingKick


func _on_aiming_timer_timeout():
	if Input.is_action_just_pressed("item") and item != null:
		aim()
	pass # Replace with function body.


func _on_aiming_kick(aiming_direction):
	match aiming_direction:
		"aim_up":
			item.action(animation_player, aim_kick_up, "aim_kick")
		"aim_left":
			if current_direction == player_direction.LEFT:
				item.action(animation_player, aim_kick_left, "aim_kick")
		"aim_right":
			if current_direction == player_direction.RIGHT:
				item.action(animation_player, aim_kick_right, "aim_kick")
	
