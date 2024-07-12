extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(_body: Node2D) -> void:
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://levels/texico_town/dios_mio/texico_start.tscn")
