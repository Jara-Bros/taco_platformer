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
	if current_state == player_detector_state_machine.ON:
		## rotate down 
		if rotation < 90:
			rotation += rotation_speed * delta 
	else:
		## player not on rotate off
		if rotation > 0: 
			rotation -= rotation_speed * delta 
	pass


func _on_player_detector_body_entered(body):
	if body.get_name() == "Taco":
		current_state = player_detector_state_machine.ON


func _on_player_detector_body_exited(body):
	if body.get_name() == "Taco":
		current_state = player_detector_state_machine.OFF
