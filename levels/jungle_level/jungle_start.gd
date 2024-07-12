extends Area2D

var jungle_level = load("res://levels/jungle_level/jungle_level.tscn").instantiate()
@onready var boogie_test: Node2D = $".."
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	

func _on_timer_timeout() -> void:
	SceneManager.change_scenes(jungle_level)
	boogie_test.queue_free()
