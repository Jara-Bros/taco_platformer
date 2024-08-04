extends Node

## This schema would be passed into a new scene, 
## It stores information about each scene as well as 
## 

@export var SCENE_DATA : Dictionary



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_scene_data(field,value):
	SCENE_DATA[field] = value
	
func get_scene_data(field):
	return SCENE_DATA[field]
	
func initialize_scene(scene_alias : String) -> void:
	SCENE_DATA[scene_alias] = {}

func is_scene_in_data(field):
	return SCENE_DATA.has(field)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
