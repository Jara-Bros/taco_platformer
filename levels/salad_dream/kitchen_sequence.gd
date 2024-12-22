extends Node2D

@onready var empanada_anim: AnimationPlayer = $EmpanadaAnimation
@onready var empanada_1: AnimatedSprite2D = $Empanada1


var data = null


func _ready() -> void:
	empanada_1.visible = false
	

func dialogic_conversation():
	Dialogic.start("kitchen_sequence")
	empanada_1.visible = true
	empanada_anim.play("empanada_move")
	await Dialogic.timeline_ended
	SceneManager.switch_scene("KitchenLineSequence", {})
