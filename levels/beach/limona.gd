extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var taco: Player = $"../Taco"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	taco.input_enabled = false
	Dialogic.start("limona_race_over")
	await Dialogic.timeline_ended
	taco.input_enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
