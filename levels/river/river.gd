extends Node2D

@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var taco: Player = $Taco
@onready var music_transition: AudioStreamPlayer2D = $MusicTransition
@onready var wing_flap_fx: AudioStreamPlayer2D = $WingFlapFX
@onready var camera_2d: Camera2D = $Taco/Camera2D



func _ready() -> void:
	camera_2d.set_limit(SIDE_TOP, -260)
	camera_2d.set_limit(SIDE_RIGHT, 830)
	# For level transition
	
	# taco.input_enabled = false
	#music_transition.play()
	#wing_flap_fx.play()
	#animation_player.play_backwards("fade_in")
	#await animation_player.animation_finished
	#taco.input_enabled = true
