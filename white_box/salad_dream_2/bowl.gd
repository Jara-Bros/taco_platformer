extends Node2D

enum bowl_state {STILL, FOLLOWING}



var current_bowl_state

# Called when the node enters the scene tree for the first time.
func _ready():
	current_bowl_state = bowl_state.STILL
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		ItemManager.connect_item_to_player(get_instance_id(), "bowl")
		call_deferred("reparent", ItemManager.get_player())
		#position += Vector2(0,-20)
	
	pass # Replace with function body.
