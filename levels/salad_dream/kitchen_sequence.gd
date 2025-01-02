extends Node2D


@onready var act_card: ColorRect = $ActCard
@onready var mr_p_timer: Timer = $Timer
@onready var mr_p_kitchen: TextureRect = $MrPKitchen
@onready var empanada_anim_player: AnimationPlayer = $AnimatedSprite2D/AnimationPlayer
@onready var geff_socks: TextureRect = $GeffSocks


var data = null


func _ready() -> void:
	pass


func dialogic_conversation():
	Dialogic.start("mr_p_initial_talk")
	await Dialogic.timeline_ended
	act_card.visible = false
	mr_p_timer.start()


func _on_timer_timeout() -> void:
	Dialogic.start("kitchen_sequence")
	mr_p_kitchen.visible = false
	empanada_anim_player.play("empanada_move")
	await Dialogic.timeline_ended
	geff_socks.visible = true
	Dialogic.start("kitchen_sequence_two")
	await Dialogic.timeline_ended
	geff_socks.visible = false
	Dialogic.start("kitchen_sequence_three")
	await Dialogic.timeline_ended
	SceneManager.switch_scene("KitchenLineSequence", {})
