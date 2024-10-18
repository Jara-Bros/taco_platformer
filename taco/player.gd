class_name Player extends CharacterBody2D


# Commented out to stop debugger warning
# signal AimingKick(aiming_direction)

var aim_kick_up : Vector2 = Vector2(0, -800)
var aim_kick_left : Vector2 = Vector2(-400, -300)
var aim_kick_right : Vector2 = Vector2(400, -300)
var pass_kick_left : Vector2 = Vector2(-400, 0)
var pass_kick_right : Vector2 = Vector2(400, 0)

@export var input_enabled:bool = true
@export var ignore_camera:bool
@export var speed : int
@export var acceleration : int
@export var jump_velocity : float
@export var ignore_gravity: bool

# Force for pushing rigid bodies
@export var push_force : int


enum player_state {WALKING, IN_AIR, KICKING}
var current_state
var prev_state

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var camera_2d: Camera2D = $Camera2D

@onready var jump_fx: AudioStreamPlayer2D = $JumpFX
@onready var taco_shoes_collision: CollisionShape2D = $TacoShoes/CollisionShape2D

@onready var taco: Player = $"."
@onready var timer: Timer = $Timer

var item = null

var direction
var player_facing
var global_delta

var GRAVITY := 980
const FALL_GRAVITY := 1750


func _ready():
	
	
	current_state = player_state.WALKING
	player_facing = 1
	if ignore_camera:
		remove_child(camera_2d)
	
	

func _get_gravity(_v : Vector2):
	if velocity.y < 0:
		return GRAVITY
	return FALL_GRAVITY


func _physics_process(delta: float) -> void:

	if not input_enabled:
		return
	
	
	direction = Input.get_axis("move_left", "move_right")


	if not is_on_floor():
		if !ignore_gravity:
			velocity.y += _get_gravity(velocity) * delta
		if Input.is_action_just_released("jump") and velocity.y < 0:
			velocity.y = jump_velocity / 4.0
		
	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		jump_fx.play()
		velocity = Vector2.UP * -1 * jump_velocity # Normal Jump action
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

	move_and_slide()
	
	
	# To move rigid bodies upon contact
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)


	if Input.is_action_just_pressed("item"):
		prev_state = current_state
		current_state = player_state.KICKING
		animation_player.play("kick")
		if item != null:
			#item.kick()
			item = null
	if Input.is_action_just_pressed("bleu"):
		
		if item != null:
			## TODO : ADD THROW ANIMATION
			item.throw()
			#item = null
	if Input.is_action_just_pressed("ground_pound"):
		# stick in ground
		if item != null:
			## TODO : ADD GROUND POUND ANIMATION
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

func _on_animation_player_animation_finished(_anim_name):
	if current_state == player_state.KICKING:
		if prev_state == player_state.KICKING:
			current_state = player_state.WALKING
		else:
			current_state = prev_state



func _on_area_2d_body_entered(body):
	if body.get_name() == "CorpoCharacter" or body.is_in_group("TomatoTom"):
		bounce(1.5)
		
	if body.is_in_group("BouncePlatforms"):
		bounce(1)
	elif body.is_in_group("BouncePlatforms2"):
		bounce(1.25)

func bounce(factor : float):
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
