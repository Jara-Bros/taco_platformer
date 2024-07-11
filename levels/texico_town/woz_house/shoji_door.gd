extends Sprite2D

@export var change_scene : PackedScene

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var texico_start: Node2D = $"../.."
@onready var taco: Player = $"../../Taco"


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	SceneManager.change_scenes(change_scene)
