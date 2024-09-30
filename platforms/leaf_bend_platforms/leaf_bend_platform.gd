extends AnimatableBody2D

@export var rotation_speed: int

enum player_detector_state_machine {ON, OFF}
var current_state


# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = player_detector_state_machine.OFF
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state == player_detector_state_machine.ON && (rotation == 0 or rotation < 35):
			rotation += rotation_speed * delta
	elif current_state == player_detector_state_machine.ON && rotation == 35:
			rotation = rotation * rotation_speed
# TODO: stop bend leaf jitter aft hitting maximum rotation 
	elif current_state == player_detector_state_machine.OFF && (rotation > 0):
		## player not on rotate off
		rotation -= rotation_speed * delta
	elif current_state == player_detector_state_machine.OFF && rotation == 0:
		rotation = rotation * rotation_speed
				


func _on_player_detector_body_entered(body):
	if body.get_name() == "Taco":
		current_state = player_detector_state_machine.ON


func _on_player_detector_body_exited(body):
	if body.get_name() == "Taco":
		current_state = player_detector_state_machine.OFF
