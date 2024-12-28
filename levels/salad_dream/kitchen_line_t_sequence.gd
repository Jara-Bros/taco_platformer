extends Node2D


@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var sous: AnimatedSprite2D = $Sous
@onready var taco_kitchen: AnimatedSprite2D = $TacoKitchen


func _ready() -> void:
	Dialogic.start("sous_timeline")
	anim_player.play("taco_kitchen_move")
	await Dialogic.timeline_ended
	taco_kitchen.visible = false
	SceneManager.set_initial_scene("SaladDream")
