extends Node2D

@onready var camera_2d: Camera2D = $Taco/Camera2D


var jump_input_events

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	get_tree().quit()
