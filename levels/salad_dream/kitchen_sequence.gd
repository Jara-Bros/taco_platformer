extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var manager: Sprite2D = $Manager
@onready var jeff: Sprite2D = $Jeff

var data = null

func _ready() -> void:
	Dialogic.start("manager_timeline")
	await Dialogic.timeline_ended
	animation_player.play("black_off")
	await animation_player.animation_finished
	animation_player.play("kitchen_line_off")
	await animation_player.animation_finished
	Dialogic.start("manager_20_timeline")
	animation_player.play("manager_talk_right")
	animation_player.play("empanada_move")
	await Dialogic.timeline_ended
	Dialogic.start("manager_2_timeline")
	animation_player.play("jeff_manager_talk")
	await Dialogic.timeline_ended
	Dialogic.start("jeff_timeline")
	animation_player.play("jeff_talk")
	await Dialogic.timeline_ended
	Dialogic.start("manager_3_timeline")
	animation_player.play("jeff_manager_talk")
	await Dialogic.timeline_ended
	Dialogic.start("jeff_2_timeline")
	animation_player.play("sock_reveal")
	await Dialogic.timeline_ended
	animation_player.play("manager_irritated")
	await animation_player.animation_finished
	SceneManager.set_initial_scene("KitchenLineSequence")
