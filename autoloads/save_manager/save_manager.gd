extends Node




# Go through everything in the persist category and ask them to return a
# dict of relevant variables.

func on_save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
			
		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
			
		# Call the node's save function.
		var node_data = node.call("save")
	
		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(node_data)
		
		# Store the save dictionary as a new line in the save file.
		save_game.store_line(json_string)
	

func on_load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
		
	# We need to revert the game state so we're not cloning objects
	# during loading. Saveable objects will be deleted
	var save_nodes = get_tree().get_nodes_in_group("Persist") 
	for i in save_nodes:
		i.queue_free()
		
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		
		var json = JSON.new()
		
		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), "in ", json_string, " at line ", json.get_error_line())
			continue
		
		# Get the data from the JSON object
		var node_data = json.get_data()
		
		# Firstly, we need to create the object and add it to the tree and set its position.
		
		var new_object = load(node_data["filename"]).instantiate()
		
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])
		
		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
