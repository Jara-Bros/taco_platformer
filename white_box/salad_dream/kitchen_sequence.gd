extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var manager: Sprite2D = $Manager

var data = null

func _ready() -> void:
	Dialogic.start("manager_timeline")
	await Dialogic.timeline_ended
	animation_player.play("black_off")
	await animation_player.animation_finished
	animation_player.play("kitchen_line_off")
	await animation_player.animation_finished
	Dialogic.start("manager_20_timeline")
	animation_player.play("empanada_move")
	await Dialogic.timeline_ended
	SceneManager.set_initial_scene("KitchenLineSequence")
