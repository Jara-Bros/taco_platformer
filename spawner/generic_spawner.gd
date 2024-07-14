extends Node2D
class_name GenericSpawner

@export var spawn_scene: PackedScene
@export_enum("left", "right", "none") var horizontal_direction : int
@export_enum("up", "down", "none") var vertical_direction : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	
func spawn(new_position):
	var spawn_instance = spawn_scene.instantiate()
	if horizontal_direction == 0:
		spawn_instance.set_horizontal_direction(-1)
	elif horizontal_direction == 1:
		spawn_instance.set_horizontal_direction(1)
	else:
		spawn_instance.set_horizontal_direction(0)
	if vertical_direction == 0:
		spawn_instance.set_vertical_direction(-1)
	elif vertical_direction == 1:
		spawn_instance.set_vertical_direction(-1)
	else:
		spawn_instance.set_vertical_direction(0)
	spawn_instance.global_position = new_position
	#global_position = new_position
	get_tree().current_scene.add_child(spawn_instance)
	
