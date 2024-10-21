extends AnimatableBody2D

@onready var turn_left: RayCast2D = $TurnLeft
@onready var turn_right: RayCast2D = $TurnRight

## Fire & Knob Pairs
@onready var grill_knob: AnimatableBody2D = $"."
@onready var grill_fire: Area2D = $"../GrillFire"
@onready var anim_player: AnimationPlayer = $"../GrillFire/AnimationPlayer"

@onready var grill_knob_2: AnimatableBody2D = $"../GrillKnob2"
@onready var grill_fire_2: Area2D = $"../GrillFire2"
@onready var anim_player_2: AnimationPlayer = $"../GrillFire2/AnimationPlayer"

@onready var grill_knob_3: AnimatableBody2D = $"../GrillKnob3"
@onready var grill_fire_3: Area2D = $"../GrillFire3"
@onready var anim_player_3: AnimationPlayer = $"../GrillFire3/AnimationPlayer"
##

@export var rotation_speed : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# For turning grill knobs
	if turn_left.is_colliding():
		if get_rotation_degrees() > -45:
			rotation -= rotation_speed * delta
		elif get_rotation_degrees() <= -45:
			pass
		
	elif turn_right.is_colliding():
		if get_rotation_degrees() < 45:
			rotation += rotation_speed * delta
		elif get_rotation_degrees() >= 45:
			pass


	## For adjusting fire height
	if get_rotation_degrees() < -23:
		anim_player.play("small_fire")
	elif get_rotation_degrees() > -23 && get_rotation_degrees() < 23:
		anim_player.play("med_fire")
	elif get_rotation_degrees() > 23:
		anim_player.play("large_fire")
	
	if grill_knob_2.get_rotation_degrees() < -23:
		anim_player_2.play("small_fire")
	elif grill_knob_2.get_rotation_degrees() > -23 && get_rotation_degrees() < 23:
		anim_player_2.play("med_fire")
	elif grill_knob_2.get_rotation_degrees() > 23:
		anim_player_2.play("large_fire")
	
	if grill_knob_3.get_rotation_degrees() < -23:
		anim_player_3.play("small_fire")
	elif grill_knob_3.get_rotation_degrees() > -23 && get_rotation_degrees() < 23:
		anim_player_3.play("med_fire")
	elif grill_knob_3.get_rotation_degrees() > 23:
		anim_player_3.play("large_fire")
	##
