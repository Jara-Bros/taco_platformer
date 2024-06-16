class_name Door extends Area2D

signal player_entered_door( door:Door, transition_type:String )

@export_enum ("north", "east", "south", "west") var entry_direction
@export_enum("fade_to_black", "fade_from_black", "no_transition") var transition_type : String
@export var push_distance:int = 16
@export var path_to_new_scene:String
@export var entry_door_name:String

func _on_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	player_entered_door.emit(self)
	
	var gameplay_node: Gameplay = get_tree().get_nodes_in_group("gameplay")[0] as Gameplay
	var unload: Node = gameplay_node.current_level
	
	
	SceneManager.swap_scenes(path_to_new_scene, gameplay_node.level_holder, unload, transition_type)
	queue_free()


func get_player_entry_vector() -> Vector2:
	var vector:Vector2 = Vector2.LEFT
	match entry_direction:
		0:
			vector = Vector2.UP
		1:
			vector = Vector2.RIGHT
		2:
			vector = Vector2.DOWN
	return (vector * push_distance) + self.position

func get_move_direction() -> Vector2:
	var direction:Vector2 = Vector2.RIGHT
	match entry_direction:
		0:
			direction = Vector2.DOWN
		1:
			direction = Vector2.LEFT
		2:
			direction = Vector2.UP
	return direction
