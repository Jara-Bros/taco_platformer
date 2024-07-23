extends Area2D

@onready var jungle_level: Node2D = $".."


func _on_body_entered(_body: Node2D) -> void:
	var waterfall = load("res://levels/river_enter/river/river.tscn").instantiate()
	waterfall.get_child(0).position = waterfall.get_spawn_location("normal_enter")
	SceneManager.change_scenes(waterfall)
	jungle_level.queue_free()
