extends Area2D

signal barb_gallery_one_switch(data)

func _on_body_entered(body: Node2D) -> void:
	SceneManager.switch_scene("BarbGallery", {
		"player_spawn_location": Vector2(696, -5)
	})
