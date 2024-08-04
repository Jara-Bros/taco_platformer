extends Area2D

signal enter_beach_from_river_ride(data)

func _on_body_entered(body: Node2D) -> void:
	enter_beach_from_river_ride.emit({})
