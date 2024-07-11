extends StaticBody2D

var speed : int = 100
@export var direction : int


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += direction * speed * delta

func set_direction(direc):
	direction = direc

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
