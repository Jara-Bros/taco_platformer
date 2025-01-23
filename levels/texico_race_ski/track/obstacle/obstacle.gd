class_name Obstacle extends Node2D

var location: int
var type:String
var is_sendable: bool
var speed : int = 10
var track
@export var can_move : bool = false
signal slow_down
var player=null
@onready var animation_player = $AnimationPlayer
@onready var parry_sound = $Parry
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
	if can_move and animation_player.is_playing() == false:
		position.x -= speed
		
	if Input.is_action_just_pressed("jump") and $Line2D.visible == true and player != null and player.is_stunned == false and (type == "nacho_boulder" or type == "flying_object"):
		
		parry()
	

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

func set_can_move(stat: bool):
	can_move = stat

func _on_body_entered(body):
	if body.is_in_group("Player") and body.is_stunned == false:
		trigger_reaction(body)
		player=body
		pass
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("taco_race_ski"):
		$Line2D.visible = true
		player = body
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.is_in_group("taco_race_ski"):
		$Line2D.visible = false
	pass # Replace with function body.
	

func parry():
	parry_sound.play()
	player.move_forward()
	$Line2D.visible = false
	var send_locations = [0,1,2]
	send_locations.remove_at(send_locations.find(track.track_id))
	var rand_index = randi_range(0,1)
	#get_tree().call_group("texico_race_ski", "toss_obstacle", track.track_id, send_locations[rand_index], self)
	if send_locations[rand_index] == send_locations.min():
		animation_player.play("send")
	else:
		animation_player.play("send_down")	
	


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "send" or anim_name == "send_down":
		var sprite_pos = $Sprite2D.global_position
		animation_player.play("RESET")
		global_position = sprite_pos
		pass
		#queue_free()
