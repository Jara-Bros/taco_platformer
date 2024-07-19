extends Area2D

var beach = load("res://levels/beach/beach.tscn").instantiate()
@onready var river_ride: Node2D = $".."

func _on_body_entered(body: Node2D) -> void:
	SceneManager.change_scenes(beach)
	river_ride.queue_free()
