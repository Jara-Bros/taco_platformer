class_name Obstacle extends Node2D

var location: int
var type:String
var is_sendable: bool
var speed : int = 10
var track
signal slow_down
# Called when the node enters the scene tree for the first time.
func _ready():
	#if type == "nacho_boulder":
		#
	#else:
		#
	#if rand_type == 0:
		#
	#elif rand_type == 1:
		#$Sprite2D.texture
	#else:
		#$Sprite2D.texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed
	pass

func set_parameters(dic: Dictionary):
	location = dic["location"]
	is_sendable = dic["is_sendable"]
	pass

func set_speed(spe):
	speed = spe
	
func trigger_reaction(body) -> void:
	pass
	
func return_track():
	return track

func _on_body_entered(body):
	if body.is_in_group("Player") and body.is_stunned == false:
		trigger_reaction(body)
		pass
	pass # Replace with function body.
