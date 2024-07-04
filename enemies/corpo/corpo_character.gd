extends CharacterBody2D


@export var walking_speed = 50
@onready var animation_player = $AnimationPlayer
@onready var right_cast = $RightCast
@onready var left_cast = $LeftCast
@onready var sprite = $Sprite2D
@onready var movement_timer = $Movement

enum state_machine {MOVING, STILL}
var current_state
var current_velocity

var direction
var current_speed

func _ready():
	current_speed = walking_speed
	direction = 1
func _physics_process(delta):
	
	if velocity.x == 0:
		current_state = state_machine.STILL
	else:
		current_state = state_machine.MOVING
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += 980 * delta

	velocity.x = current_speed
	move_and_slide()
	
	update_direction()
	
	if current_state == state_machine.STILL:
		animation_player.play("still")
	elif current_state == state_machine.MOVING:
		if direction > 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		animation_player.play("walk")
		
func update_direction():
	print(left_cast.get_collider())
	if left_cast.get_collider() != null:
		if left_cast.get_collider().get_name() == "wall":
			sprite.flip_h = true
	elif right_cast.get_collider() != null:
		if right_cast.get_collider().get_name() == "wall":
			sprite.flip_h = false


func _on_movement_timeout():
	movement_timer.wait_time = randf_range(0.5,2)
	var num = randi_range(0, 10000)
	var direction_check = randi_range(0, 1)
	if direction_check == 0:
		velocity.x = walking_speed
		current_speed =  walking_speed
		direction = 1
	else:
		velocity.x = -1 * walking_speed
		current_speed =  -1 * walking_speed
		direction = -1

	movement_timer.start()


#func _on_head_body_entered(body):
	#print(body)
	#if body.get_name() == "Taco":
		#velocity.x = 0
		#current_speed =  0
		#animation_player.play("hit")


#func _on_animation_player_animation_finished(anim_name):
	#if anim_name == "hit":
		#velocity.x = direction * walking_speed
		#current_speed = direction * walking_speed
