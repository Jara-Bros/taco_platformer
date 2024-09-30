extends Node

func save_game():
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		node.save()
