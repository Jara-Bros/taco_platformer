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
@export var jump_velocity : float
@export var ignore_gravity: bool
@export var zoom : Vector2 = Vector2(1,1)
# Force for pushing rigid bodies
@export var push_force : float


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

var time_buffer : float = 0.01

var item = null

var direction
var player_facing
var global_delta

var GRAVITY := 980
const FALL_GRAVITY := 980


func _ready():
	
	current_state = player_state.WALKING
	player_facing = 1
	if ignore_camera:
		remove_child(camera_2d)
	camera_2d.zoom = zoom
	
	

func _get_gravity(_v : Vector2):
	if velocity.y < 0:
		return GRAVITY
	return FALL_GRAVITY


func _physics_process(delta: float) -> void:

	if not input_enabled:
		return
	
	
	direction = Input.get_axis("move_left", "move_right")
 

	if not is_on_floor():
		if !ignore_gravity  :
			if Input.is_action_pressed("jump"):
				velocity.y += 750 * delta
			else:
				velocity.y += 1500 * delta
			 
		
	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		jump_fx.play()
		velocity.y = -1 * jump_velocity
		change_state(player_state.IN_AIR)
		
	if is_on_floor() and current_state == player_state.IN_AIR and velocity.y == 0:
		change_state(player_state.WALKING)
			
	if current_state == player_state.WALKING:
			if direction:
				velocity.x = move_toward(velocity.x, direction * 225.5, 35)
			else:
				velocity.x = move_toward(velocity.x, 0, 30)
	elif current_state == player_state.IN_AIR:
		if (direction == 1 and velocity.x < 0) or (direction == -1 and velocity.x > 0):
			velocity.x = move_toward(velocity.x, 0, 5)
		elif direction == 0:
			velocity.x = move_toward(velocity.x, 0, 9.5)
		else:
			velocity.x = move_toward(velocity.x, direction * 325.5, 10)
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
	
#func set_acceleration(accel):
	#acceleration = accel
#func set_speed(spe):
	#speed = spe
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
