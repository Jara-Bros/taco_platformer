extends Node2D

@onready var camera_2d: Camera2D = $Taco/Camera2D
@onready var animation_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var taco: Player = $Taco
@onready var river_slow_bm: AudioStreamPlayer = $RiverSlowBM
@onready var music_transition: AudioStreamPlayer2D = $MusicTransition


func _ready() -> void:
	camera_2d.set_limit(SIDE_BOTTOM, 450)
	camera_2d.set_limit(SIDE_RIGHT, 855)
	camera_2d.set_limit(SIDE_TOP, 245)
	taco.input_enabled = false
	music_transition.play()
	animation_player.play_backwards("fade_in")
	await animation_player.animation_finished
	taco.input_enabled = true
	river_slow_bm.play()
