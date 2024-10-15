extends Node2D

# The purpose of this node is to
# allow debugging to move current player 
# in the scene tree to be saved at a certain
# point in space.
# NOTE: user must manually drag the player to where
# they actually want the player to start, since this
# will move them as a result
# NOTE: only for debugging purposes only

var player : Node2D = null
var player_initial_position : Vector2 = Vector2.ZERO
@onready var canvas_layer = $CanvasLayer
@onready var label_timer = $LabelTimer
var label : Label = Label.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_nodes_in_group("Player")[0]
	var parent_level_path = get_tree().current_scene.scene_file_path.split("/")
	parent_level_path[parent_level_path.size() - 1] = ""
	var parent_path = "/".join(parent_level_path)
	var changed_paths = get_tree().current_scene.scene_file_path.split("/")
	changed_paths[changed_paths.size() - 1] = "save_point"
	var final_path = "/".join(changed_paths)
	var dirObject : DirAccess = DirAccess.open(parent_path)
	print(parent_path)
	if final_path != null and dirObject.dir_exists(final_path):
		var write_to = get_tree().current_scene.scene_file_path.split("/")
		write_to[write_to.size() - 1] = "save_point/save_point.tscn"
		var final_ = "/".join(write_to)
		
		var saved_player = ResourceLoader.load(final_).instantiate()
		print(saved_player)
		print(player)
		player.queue_free()
		player = saved_player
		label.text = "Player Loaded"
		canvas_layer.add_child(label)
		label_timer.start()
		

	player_initial_position = player.position
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		var scene = PackedScene.new()
		var scene_root = player
		scene.pack(scene_root)
		var path_parts = get_tree().current_scene.scene_file_path.split("/")
		path_parts[path_parts.size() - 1] = ""
		var new_path = "/".join(path_parts)
		var dir = DirAccess.open(new_path)
		dir.make_dir("save_point")
		
		# Print the new path
		print(new_path)  # Outputs: res://levels/lunch_rush_level/save_point/save_point.tscn
		var changed_paths = get_tree().current_scene.scene_file_path.split("/")
		changed_paths[changed_paths.size() - 1] = "save_point/save_point.tscn"
		var final_path = "/".join(changed_paths)
		print(final_path)
		ResourceSaver.save(scene, final_path)
		label.text = "Player Saved"
		label.show()
		label_timer.start()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ready() -> void:
	get_tree().current_scene.add_child.call_deferred(player)
	pass # Replace with function body.


func _on_label_timer_timeout() -> void:
	label.hide()
	pass # Replace with function body.
