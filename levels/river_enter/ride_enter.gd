extends Area2D


var river_ride = load("res://levels/river_enter/river/river_ride.tscn").instantiate()
@onready var river_enter: Node2D = $".."



func _on_body_entered(body: Node2D) -> void:
	SceneManager.change_scenes(river_ride)
	river_enter.queue_free()
