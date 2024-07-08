extends Area2D

@onready var camera_2d: Camera2D = $"../TacoBoogie/Camera2D"

func _on_body_entered(body: Node2D) -> void:
	camera_2d.zoom = Vector2(1.5, 1.5)
