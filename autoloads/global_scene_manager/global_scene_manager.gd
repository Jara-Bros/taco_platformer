extends Node
class_name GlobalSceneManager

# A collection of scenes in the game. Scenes are added via Inspector.
@export var scenes : Dictionary = {}

# An arbitary dict that stores data when switching scenes

var persistent_data : Dictionary = {}

# Alias of the currently selected scene
var current_scene_alias : String = ""


# Find the initial scene as defined in the project settings
func _ready() -> void:
	#var main_scene : StringName = ProjectSettings.get_setting("application/run/main_scene")
	current_scene_alias = get_tree().current_scene.name



# Add a new scene to the scene collection
# Parameter scene_alias: The alias used for finding the scene in the collection
# Parameter scene_path: The full path to the scene file in the file system
func add_scene(scene_alias : String, scene_path : String) -> void:
	scenes[scene_alias] = scene_path
	

# Remove an existing scene from the scene collection
func remove_scene(scene_alias : String) -> void:
	scenes.erase(scene_alias)


# Switch to the requested scene based on its alias
func switch_scene(scene_alias : String, data : Dictionary) -> void:
	get_tree().change_scene_to_file.bind(scenes[scene_alias]).call_deferred()
	PersistantDataHandler.update_scene_data(scene_alias, data)

func set_initial_scene(scene_alias : String) -> void:
	get_tree().change_scene_to_file(scenes[scene_alias])
	PersistantDataHandler.initialize_scene(scene_alias)
	
func is_scene_initialized(scene):
	return PersistantDataHandler.is_scene_in_data(scene)	
	
func get_transfer_data(scene):
	return PersistantDataHandler.get_scene_data(scene)


func restart_scene() -> void:
	get_tree().reload_current_scene()

func quit_game() -> void:
	get_tree().quit()


# Return the number of scenes in the collection
func get_scene_count() -> int:
	return scenes.size()


# Return the alias of the current scene
func get_current_scene_alias() -> String:
	return current_scene_alias


func add_scene_child(_scene : Node2D):
	add_child(_scene)

func remove_scene_child(_scene : Node2D):
	remove_child(_scene)
