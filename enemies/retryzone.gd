extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(_body: Node2D) -> void:
	timer.start()

func _on_timer_timeout() -> void:
	if get_tree():
		get_tree().call_deferred("reload_current_scene")
	else:
		SceneManager.reload_scenes()
