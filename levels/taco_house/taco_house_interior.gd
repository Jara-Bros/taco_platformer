extends Node2D

@onready var taco: Sprite2D = $Taco
@onready var bleu: Sprite2D = $Bleu
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var camera: Camera2D = $Camera2D


func _ready() -> void:
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
	camera.zoom = Vector2(1, 1)
	bleu.frame = 1
	await Dialogic.timeline_ended
	animation_player.play("black_on")
	await animation_player.animation_finished
	SceneManager.set_initial_scene("DiosMio")
	
