extends Node2D

@onready var taco: Sprite2D = $Taco
@onready var bleu: Sprite2D = $Bleu
@onready var camera: Camera2D = $Camera2D


func _ready() -> void:
	pass
	


func _on_timer_timeout() -> void:
	camera.enabled = true
	Dialogic.start("bleu_bedroom_timeline")
	taco.frame = 0
	await Dialogic.timeline_ended
	Dialogic.start("bleu_bedroom_2_timeline")
	taco.flip_h = false
	taco.frame = 1
	await Dialogic.timeline_ended
	Dialogic.start("bleu_bed_convo_timeline")
	bleu.frame = 3
	await Dialogic.timeline_ended
	Dialogic.start("bleu_bed_convo_2_timeline")
	camera.enabled = false
	bleu.frame = 1
	await Dialogic.timeline_ended
	SceneManager.switch_scene("OpeningMovie", {})
