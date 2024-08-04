extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var dios_mio: Node2D = $"../.."
@onready var taco: Player = $"../../Taco"

signal boogie_board_swtich(data)

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	taco.input_enabled = false
	Dialogic.start("limona_timeline")
	await Dialogic.timeline_ended
	boogie_board_swtich.emit({})
	taco.input_enabled = true
