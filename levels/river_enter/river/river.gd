extends Node2D

@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var taco: Player = $Taco
@onready var music_transition: AudioStreamPlayer2D = $MusicTransition
@onready var wing_flap_fx: AudioStreamPlayer2D = $WingFlapFX
@onready var camera_2d: Camera2D = $Taco/Camera2D


var player_spawn_location_dict = {
	normal_enter = Vector2(750, -250),
	butterfly_enter = Vector2(700, 725)
}

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]

func _ready() -> void:
	camera_2d.set_limit(SIDE_TOP, -260)
	camera_2d.set_limit(SIDE_RIGHT, 830)
	camera_2d.set_limit(SIDE_LEFT, -550)
	var initialized_data = SceneManager.get_transfer_data("WaterfallLevel")
	$Taco.position = initialized_data["player_spawn_location"]
	
	#if taco.position.y > 700:
		#camera_2d.set_limit(SIDE_TOP, 750)
		#camera_2d.set_limit(SIDE_LEFT, 25)
		#taco.input_enabled = false
		#music_transition.play()
		#wing_flap_fx.play()
		#animation_player.play_backwards("fade_in")
		#await animation_player.animation_finished
		#taco.input_enabled = true


func _on_river_ride_enter_river_ride_enter_from_waterfall(data):
	SceneManager.switch_scene("RiverRideEnter", {})
