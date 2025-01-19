extends Marker2D

var spawn_object: Callable
var obstacle: Dictionary
var can_move: bool = false
var speed:int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		position.x -= speed
	pass

func set_can_move(stat: bool):
	can_move = stat
func _on_visible_on_screen_notifier_2d_screen_entered():
	spawn_object.call(obstacle,position)
	visible = false
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("made it")
	queue_free()
	pass # Replace with function body.
