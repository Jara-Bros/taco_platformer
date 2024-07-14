extends StaticBody2D

var speed : int = 100
var horizontal_direction : int
var vertical_direction : int


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += horizontal_direction * speed * delta
	position.y += vertical_direction * speed * delta

func set_horizontal_direction(direc):
	horizontal_direction = direc
	
func set_vertical_direction(direc):
	vertical_direction = direc

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
