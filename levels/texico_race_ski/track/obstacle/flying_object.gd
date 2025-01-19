class_name FlyingObstacle extends Obstacle

var is_high: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	var rand = randi_range(0,1)
	if rand == 0:
		position.y -= 55
		is_high=true
	pass # Replace with function body.

 

func trigger_reaction(body) -> void:
	if body.is_in_group("Player") and $RayCast2D.is_colliding() == true:
		body.bounce()
	if body.is_in_group("Player") and $RayCast2D.is_colliding() == false:
		body.spin_out()
		#var track = super.return_track()
		#track.slow_down()
		body.move_back()
	pass
