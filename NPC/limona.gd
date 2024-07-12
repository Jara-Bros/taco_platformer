extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var dios_mio: Node2D = $"../.."
@onready var taco: Player = $"../../Taco"


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	var boogie_test = load("res://levels/testing/boogie_test.tscn").instantiate()
	taco.input_enabled = false
	Dialogic.start("limona_timeline")
	await Dialogic.timeline_ended
	SceneManager.change_scenes(boogie_test)
	taco.input_enabled = true
	dios_mio.queue_free()
