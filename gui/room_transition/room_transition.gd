extends Area2D

signal gallery_to_office(data)

func _on_body_entered(_body: Node2D) -> void:
	gallery_to_office.emit({
		"player_spawn_location" : Vector2(-13, -4)
	})
