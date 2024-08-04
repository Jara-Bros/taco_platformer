extends Area2D

signal barb_office_switch(data)

func _on_body_entered(body: Node2D) -> void:
	barb_office_switch.emit({
		"player_spawn_location" : Vector2(-13,-4)
	})
