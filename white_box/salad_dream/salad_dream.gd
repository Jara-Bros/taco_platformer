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
	animation_player.play("mr_p_talk_sequence")
	await animation_player.animation_finished
	animation_player.play("sous_talk_sequence")
	await animation_player.animation_finished
	renable_kick()
	SceneManager.set_initial_scene("TacoHouse")

func manager_talk_one():
	Dialogic.start("manager_offscreen_1_timeline")
	
func manager_talk_two():
	Dialogic.start("manager_offscreen_2_timeline")

func sous_talk_one():
	Dialogic.start("sous_offscreen")
	
func sous_talk_two():
	Dialogic.start("sous_offscreen_2")

func play_animation_fade_in():
	animation_player.play("fade_in")
