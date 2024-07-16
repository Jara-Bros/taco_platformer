extends StaticBody2D


var mid_point : float = position.x
enum rotate_state_machine {ON_PLATFORM, OFF_PLATFORM}
var rotated_towards = rotate_state_machine.OFF_PLATFORM
var mid_rotation : float = 0.3
@export var angular_velocty : float
var MAX_ROTATION = 0.6

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotated_towards == rotate_state_machine.ON_PLATFORM:
		var player_position = ItemManager.get_player().position
		if player_position.x < position.x and rotation > 0:
			## rotate left
			rotation -= angular_velocty * delta
		elif player_position.x > position.x and rotation < MAX_ROTATION:
			## rotate right
			rotation += angular_velocty * delta
	if rotated_towards == rotate_state_machine.OFF_PLATFORM:
		if rotation> 0 and rotation < mid_rotation:
			rotation -= angular_velocty * delta
		elif rotation <  MAX_ROTATION and rotation > mid_rotation:
			rotation += angular_velocty * delta


func _on_area_2d_body_entered(body):
	if body.get_name() == "Taco":
		rotated_towards = rotate_state_machine.ON_PLATFORM

func _on_area_2d_body_exited(body):
	### just do the opposite direction that the player caused to rotate
	rotated_towards = rotate_state_machine.OFF_PLATFORM
