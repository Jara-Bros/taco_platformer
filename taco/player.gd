class_name Player extends CharacterBody2D

signal AimingKick(aiming_direction)
var aim_kick_up : Vector2 = Vector2(0, -800)
var aim_kick_left : Vector2 = Vector2(-400, -300)
var aim_kick_right : Vector2 = Vector2(400, -300)
var pass_kick_left : Vector2 = Vector2(-400, 0)
var pass_kick_right : Vector2 = Vector2(400, 0)

@export var input_enabled:bool = true
@export var ignore_camera:bool
@export var speed : int
@export var acceleration : int
@export var jump_velocity : int
@export var gravity : int
@export var fallMultiplier = 2 
@export var lowJumpMultiplier = 10 

enum player_state {WALKING, IN_AIR, KICKING}
var current_state
var prev_state

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var camera_2d: Camera2D = $Camera2D

@onready var coyote_timer: Timer = $Timers/CoyoteTimer
@onready var buffer_timer: Timer = $Timers/BufferTimer
@onready var variable_jump_height_timer: Timer = $Timers/VariableJumpHeightTimer

@onready var jump_fx: AudioStreamPlayer2D = $JumpFX
@onready var taco_shoes_collision: CollisionShape2D = $TacoShoes/CollisionShape2D


@onready var yellow_red_card: AnimatedSprite2D = $YellowRedCard
@onready var whistle_fx: AudioStreamPlayer2D = $WhistleFX
@onready var time_out_player: AnimationPlayer = $TimeOutHand/AnimationPlayer



var item = null

var direction
var player_facing
var global_delta


# Force for pushing rigid bodies
var push_force = 40.0


# Counter for yellow card hits
var yellow_card_counter : int = 0


func _ready():
	current_state = player_state.WALKING
	player_facing = 1
	if ignore_camera:
		remove_child(camera_2d)
	
	
	
#
#func _input(event):
	## buffer timer
	#if Input.is_action_just_pressed("jump") and is_on_floor_only() and buffer_timer.is_stopped() == false:
		#jump_deceleration(global_delta, variable_jump_height_timer.wait_time)
	#if Input.is_action_just_pressed("jump") and velocity.y > 0 and coyote_timer.is_stopped() == false:
		#jump_deceleration(global_delta, variable_jump_height_timer.wait_time)
	##
#
	#
var old_velocity
func _physics_process(delta: float) -> void:
	if not input_enabled:
		return
	
	direction = Input.get_axis("move_left", "move_right")

	# For walk and run speeds
	velocity.y += gravity * delta
	

		#Jump Physics
	if velocity.y > 0: #Player is falling
		velocity += Vector2.UP * (-9.81) * (fallMultiplier) #Falling action is faster than jumping action | Like in mario

	elif velocity.y < 0 && Input.is_action_just_released("ui_accept"): #Player is jumping 
		velocity += Vector2.UP * (-9.81) * (lowJumpMultiplier) #Jump Height depends on how long you will hold key

	if is_on_floor():
		#if current_state["movement"] == player_movement_state.IN_AIR:
			#change_state("movement", player_movement_state.WALKING)
		if Input.is_action_just_pressed("jump"): 
			jump_fx.play()
			velocity = Vector2.UP * -1 * jump_velocity #Normal Jump action
			change_state(player_state.IN_AIR)
			

	
	if direction:
		if current_state == player_state.WALKING:
			velocity.x = move_toward(velocity.x, direction * speed, 50)
		elif current_state == player_state.IN_AIR and direction * velocity.x < 0:
			velocity = velocity.lerp(Vector2(direction * speed, velocity.y), acceleration * delta)
		else:
			velocity.x = move_toward(velocity.x, direction * speed, 50)
			
	else:
		if current_state == player_state.WALKING:
			velocity.x = move_toward(velocity.x, 0, acceleration)
		else:
			velocity.x = move_toward(velocity.x, 0, acceleration)
		#change_state("lateral", player_lateral_movement_state.STILL)
		#if not is_on_floor_only():
			#velocity.x = move_toward(velocity.x, 0, 13)
		#else:
			#velocity.x = move_toward(velocity.x, 0, acceleration)
#
	move_and_slide()
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#if collision.get_collider().is_in_group("platforms"):
			#pass
			#print("Collided with: ", collision.get_collider().get_node("StaticBody2D").get_material())
	#move_and_collide(move_toward(velocity.x, direction * speed, 50))
	#move_and_slide()
#
	## Add the gravity.
	#
	#if not is_on_floor_only() and Input.is_action_pressed("jump"):
		#velocity.y += 1.5 * gravity * delta
	#if not is_on_floor_only() and Input.is_action_pressed("jump") == false and current_state["vertical"] == player_vertical_movement_state.GOING_UP:
		##print("decelerating before peak")
		#velocity.y += 1.75 * gravity * delta
	#if not is_on_floor_only() and current_state["vertical"] == player_vertical_movement_state.FALLING_DOWN:
		#print("falling")
		#velocity.y += 1 * gravity * delta
	#if velocity.y < 0:
		#change_state("vertical", player_vertical_movement_state.GOING_UP)
	#elif velocity.y == 0 and is_on_floor_only():
		#change_state("vertical", player_vertical_movement_state.ON_GROUND)
	#elif velocity.y == 0 and not is_on_floor_only():
		#change_state("vertical", player_vertical_movement_state.FALLING_DOWN)
	#if velocity.y > 0:
		#buffer_timer.start()
	#if current_state["vertical"] == player_vertical_movement_state.ON_GROUND:
		#coyote_timer.start()
		
	


	# Handles enable/disable TacoShoe collision box
	#if is_on_floor():
		#taco_shoes_collision.set_deferred("disabled", true)
	#else:
		#taco_shoes_collision.set_deferred("disabled", false)



		
		
		
	## Handle jump.
	#if Input.is_action_pressed("jump") and current_state["vertical"] == player_vertical_movement_state.GOING_UP and variable_jump_height_timer.is_stopped() == false:
		#jump_deceleration(delta, variable_jump_height_timer.time_left)
	#
	#if Input.is_action_just_pressed("jump") and is_on_floor_only():
		#change_state("vertical", player_vertical_movement_state.GOING_UP)
		#variable_jump_height_timer.start()
		#jump_deceleration(delta, variable_jump_height_timer.time_left)
		##change_state("vertical", player_vertical_movement_state.GOING_UP)
		##velocity.y = jump_velocity
		##if direction:
			##velocity.x = direction * speed
	#if Input.is_action_just_released("jump") and not is_on_floor_only():
		#change_state("vertical", player_vertical_movement_state.FALLING_DOWN)
		#move_toward(velocity.y ,0 , -500)
		#velocity.y = 0
	# Handle action
	if Input.is_action_just_pressed("item"):
		prev_state = current_state
		current_state = player_state.KICKING
		animation_player.play("kick")
		if item != null:
			#animation_player.play("kick")
			item.kick()
			item = null
	if Input.is_action_just_pressed("bleu"):
		
		if item != null:
			## TODO : ADD THROW ANIMATION
			#animation_player.play("kick")
			item.throw()
			#item = null
	if Input.is_action_just_pressed("ground_pound"):
		# stick in ground
		if item != null:
			## TODO : ADD GROUND POUND ANIMATION
			#animation_player.play("kick")
			item.stick()
			#item = null
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
		current_state = state
	
func set_acceleration(accel):
	acceleration = accel
func set_speed(spe):
	speed = spe
func set_jump_velocity(new_jump):
	jump_velocity = new_jump

func _on_animation_player_animation_finished(anim_name):
	if current_state == player_state.KICKING:
		if prev_state == player_state.KICKING:
			current_state = player_state.WALKING
		else:
			current_state = prev_state



func _on_area_2d_body_entered(body):
	if body.get_name() == "CorpoCharacter" or body.get_name() == "TomatoTomCharacter":
		bounce(1.5)
		yellow_card_counter += 1
		change_card_sprite(yellow_card_counter)
		

func change_card_sprite(c : int):
	match c:
		0:
			yellow_red_card.frame = 0
		
		1:
			yellow_red_card.frame = 1
		2:
			yellow_red_card.frame = 3
			whistle_fx.play()
			await whistle_fx.finished
			get_tree().paused = true
			time_out_player.play("move_grab")
			get_tree().reload_current_scene()
		
		_:
			pass

func bounce(factor):
	velocity.y = -1 * 300 * factor
	if velocity.y >= 0:
		jump_velocity = jump_velocity / 2.0


# To Save Game
func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y
	}
	return save_dict
