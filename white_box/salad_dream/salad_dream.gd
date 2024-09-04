extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var taco: Player = $Taco

var kick_input_events

func disable_kick():
	kick_input_events = InputMap.action_get_events("item")
	InputMap.action_erase_events("item")

func renable_kick():
	for input_event in kick_input_events:
		InputMap.action_add_event("item", input_event)

func _ready() -> void:
	disable_kick()
	Dialogic.start("manager_offscreen_1_timeline")
	await Dialogic.timeline_ended
	animation_player.play("fade_in")
	await animation_player.animation_finished
	renable_kick()
	SceneManager.set_initial_scene("TacoHouse")
