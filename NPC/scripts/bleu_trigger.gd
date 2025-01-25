extends Node2D


@onready var interaction_area: InteractionArea = $InteractionArea
@onready var taco: Player = $"../Taco"


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	Dialogic.start("taco_finds_bleu_timeline")
	await Dialogic.timeline_ended
	SceneManager.switch_scene("ThanksPlaying", {})
