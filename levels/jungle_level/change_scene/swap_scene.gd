extends Area2D

@onready var jungle_level: Node2D = $".."

signal enter_waterfall(data)

func _on_body_entered(_body: Node2D) -> void:
	print("made it")
	enter_waterfall.emit({
		"player_spawn_location": Vector2(750, -250),
	})
