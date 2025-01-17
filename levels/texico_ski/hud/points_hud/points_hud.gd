extends CanvasLayer

var points = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_trick_points(trick_points):
	$ColorRect/Label.text = "Points: " + str(points + trick_points)
	points += trick_points
