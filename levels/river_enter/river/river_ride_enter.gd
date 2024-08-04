extends Area2D

@onready var waterfall: Node2D = $".."

signal river_ride_enter_from_waterfall(data)

func _on_body_entered(_body: Node2D) -> void:
	river_ride_enter_from_waterfall.emit({})
