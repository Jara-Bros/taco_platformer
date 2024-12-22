extends Node

var items = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#func follow_with_item(_item_type, location):
	#var player_node = get_player()
	#var player_position = player_node.position
	#var distance = player_position.distance_to(location)
	#if distance > 10:
		#return player_position
	#else:
		#return null

func connect_item_to_player(instance_id, group):
	var list_of_balls = get_tree().get_nodes_in_group(group)
	for ball in list_of_balls:
		print( ball.get_instance_id())
		if ball.get_instance_id() == instance_id:
			var player = get_player()
			player.set_item(ball)
			
			#player.reparent(ball)

func add_to_items_list(item):
	items.append(item)
	
func get_items_list():
	return items.size()

func clear_list():
	items.clear()

func get_player():
	var player_node = get_tree().get_nodes_in_group("Player")[0]  
	return player_node
