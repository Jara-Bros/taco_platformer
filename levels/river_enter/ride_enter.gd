extends Area2D


signal river_ride_from_river_enter(data)

func _on_body_entered(body: Node2D) -> void:
	river_ride_from_river_enter.emit({})
