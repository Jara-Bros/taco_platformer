extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var manager: Sprite2D = $Manager

## TODO: Figure out how to time the manager's dialogue with
# changes in his sprite animation

func _ready() -> void:
	Dialogic.start("manager_timeline")
	await Dialogic.timeline_ended
	animation_player.play("black_off")
	await animation_player.animation_finished
	animation_player.play("kitchen_line_off")
	await animation_player.animation_finished
	Dialogic.start("manager_2_timeline")
	await Dialogic.timeline_ended
