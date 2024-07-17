extends StaticBody2D


@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D


func _on_timer_timeout() -> void:
	collision_polygon_2d.queue_free()
