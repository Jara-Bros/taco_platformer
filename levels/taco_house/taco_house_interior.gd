extends Node2D

@onready var taco_sprite: Sprite2D = $Sprite2D7
@onready var bleu_sprite: Sprite2D = $Sprite2D6
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	Dialogic.start("bleu_bedroom_timeline")
	taco_sprite.frame = 0
	await Dialogic.timeline_ended
	Dialogic.start("bleu_bedroom_2_timeline")
	taco_sprite.flip_h = false
	taco_sprite.frame = 1
	await Dialogic.timeline_ended
	Dialogic.start("bleu_bed_convo_timeline")
	bleu_sprite.frame = 1
	await Dialogic.timeline_ended
	Dialogic.start("bleu_bed_convo_2_timeline")
	animation_player.play("black_on")
	await Dialogic.timeline_ended
	SceneManager.set_initial_scene("DiosMio")
	
