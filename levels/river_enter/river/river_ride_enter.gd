extends Area2D

@onready var waterfall: Node2D = $".."


func _on_body_entered(_body: Node2D) -> void:
	var river_enter = load("res://levels/river_enter/river_enter.tscn").instantiate()
	SceneManager.change_scenes(river_enter)
	waterfall.queue_free()
