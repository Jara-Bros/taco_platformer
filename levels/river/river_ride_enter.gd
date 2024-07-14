extends Area2D

@onready var river: Node2D = $".."


func _on_body_entered(body: Node2D) -> void:
	var river_ride = load("res://levels/river/river_ride.tscn").instantiate()
	SceneManager.change_scenes(river_ride)
	river.queue_free()
