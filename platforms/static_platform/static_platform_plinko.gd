extends StaticBody2D

@onready var timer: Timer = $Timer



func _on_area_2d_body_entered(_body: Node2D) -> void:
	timer.start()
	timer.wait_time = 4


func _on_timer_timeout() -> void:
	queue_free()
