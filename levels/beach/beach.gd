extends Node2D

@onready var camera_2d: Camera2D = $Taco/Camera2D



var jump_input_events

func _ready() -> void:
	camera_2d.set_limit(SIDE_BOTTOM, 50)
	camera_2d.set_limit(SIDE_LEFT, -570)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	get_tree().quit()
