extends Area2D

@onready var waterfall: Node2D = $".."

func _on_body_entered(body: Node2D) -> void:
	SceneManager.switch_scene("RiverEnter")
