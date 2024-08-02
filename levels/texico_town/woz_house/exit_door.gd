extends Area2D

@onready var taco: Player = $"../Taco"


func _on_body_entered(body: Node2D) -> void:
	SceneManager.switch_scene("DiosMio")
