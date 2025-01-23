class_name NachoBoulder extends Obstacle



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
  

func trigger_reaction(body) -> void:
	body.spin_out()
	#var track = super.return_track()
	#track.slow_down()
	body.move_back()
	$AudioStreamPlayer2D.play()
