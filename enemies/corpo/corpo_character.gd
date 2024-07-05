extends AnimatableBody2D

signal flip_action(direction)

@export var walking_speed = 50
@onready var animation_player = $AnimationPlayer
@onready var right_cast = $RightCast
@onready var left_cast = $LeftCast
@onready var sprite = $Sprite2D
@onready var movement_timer = $Movement
@onready var collide_timer = $Colliding
@onready var hit_timer = $HitTimer

enum state_machine {MOVING, STILL, HIT}
var current_state
var current_velocity

var direction
var current_speed

func _ready():
	current_speed = walking_speed
	direction = 1
func _physics_process(delta):
	
	#if constant_linear_velocity.x == 0:
		#current_state = state_machine.STILL
	#else:
		#current_state = state_machine.MOVING
	#
	if current_state == state_machine.MOVING:
		position.x +=  direction * current_speed * delta
		if left_cast.is_colliding() and collide_timer.is_stopped():
			flip_action.emit("left")
		elif right_cast.is_colliding()  and collide_timer.is_stopped():
			flip_action.emit("right")
		if direction > 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
			
		animation_player.play("walk")
	elif current_state == state_machine.STILL:
		animation_player.play("still")
	elif current_state == state_machine.HIT:
		animation_player.play("hit")
	#if current_state == state_machine.STILL:
		#animation_player.play("still")
	#elif current_state == state_machine.MOVING:

	
		
func update_direction():
	if left_cast.get_collider() != null:
		if left_cast.get_collider().get_name() == "wall":
			sprite.flip_h = true
			direction = direction * -1
	elif right_cast.get_collider() != null:
		if right_cast.get_collider().get_name() == "wall":
			sprite.flip_h = false
			direction = direction * -1


func _on_movement_timeout():
	movement_timer.wait_time = randf_range(0.5,2)
	var movement_determination = randi_range(0,1)
	if movement_determination == 0:
		## we wont moving
		current_state = state_machine.STILL
	else:
		## we will moving
		current_state = state_machine.MOVING
		var direction_determination = randi_range(0,1)
		if direction_determination == 0:
			direction = 1
		else:
			direction = -1
	movement_timer.start()


func _on_head_body_entered(body):
	if body.get_name() == "Taco":
		current_state = state_machine.HIT
		movement_timer.stop()
		hit_timer.start()




func _on_flip_action(direc):
	if direc == "left":
		sprite.flip_h = true
	elif direc == "right":
		sprite.flip_h = false
	direction = direction * -1
	collide_timer.start()


func _on_colliding_timeout():
	pass 


func _on_hit_timer_timeout():
	movement_timer.start()
	current_state = state_machine.MOVING


func _on_body_body_entered(body):
	if body.get_name() == "Bleu":
		current_state = state_machine.HIT
		movement_timer.stop()
		hit_timer.start()
