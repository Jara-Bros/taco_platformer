extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	Dialogic.start("manager_offscreen_1_timeline")
	await Dialogic.timeline_ended
	animation_player.play("fade_in")
	await animation_player.animation_finished
	SceneManager.set_initial_scene("TacoHouse")
