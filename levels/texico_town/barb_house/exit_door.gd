extends Area2D

signal barb_gallery_to_dios_mio(data)

func _on_body_entered(body: Node2D) -> void:
	barb_gallery_to_dios_mio.emit({
		"player_spawn_location" : Vector2(650, 100)
	})
