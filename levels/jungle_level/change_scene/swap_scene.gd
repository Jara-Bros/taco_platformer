extends Area2D

@onready var jungle_level: Node2D = $".."


func _on_body_entered(_body: Node2D) -> void:
	SceneManager.switch_scene("WaterfallLevel")
