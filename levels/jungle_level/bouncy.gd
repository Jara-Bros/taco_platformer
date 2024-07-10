extends Area2D

@onready var taco: Player = $"../Taco"

func _on_body_entered(body: Node2D) -> void:
	taco.jump_velocity += 2
