extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	get_parent().queue_free()