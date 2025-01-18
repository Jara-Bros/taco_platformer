class_name SpeedBoost extends Obstacle


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func trigger_reaction(body):
	var track = super.return_track()
	track.speed_up()
	body.move_forward()
