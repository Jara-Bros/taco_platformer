extends Node2D


func _get_configuration_warnings():
	if get_child_count() < 1:
		return ["Need at least one spawner"]
	else:
		return []
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
