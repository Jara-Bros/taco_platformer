extends AnimatableBody2D

@export var rotation_speed: int

enum player_detection_state_machine {ON, OFF}
var current_state


func _ready() -> void:
	current_state = player_detection_state_machine.OFF


func _process(delta: float) -> void:
	if current_state == player_detection_state_machine.ON:
		rotation += rotation_speed * delta
	elif current_state == player_detection_state_machine.ON:
		rotation += rotation_speed * delta * 0


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_name() == "TacoShoes":
		current_state = player_detection_state_machine.ON
		
func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.get_name() == "TacoShoes":
		current_state = player_detection_state_machine.OFF
