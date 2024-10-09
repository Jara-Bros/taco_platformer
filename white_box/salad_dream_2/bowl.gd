extends RigidBody2D

enum bowl_state {STILL, FOLLOWING}



var current_bowl_state

# Called when the node enters the scene tree for the first time.
func _ready():
	current_bowl_state = bowl_state.STILL
	gravity_scale = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("item")):
		throw() 

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		ItemManager.connect_item_to_player(get_instance_id(), "bowl")
#		$RemoteTransform2D.remote_path = 
		ItemManager.get_player().get_child(0).remote_path = get_path()
	#	call_deferred("reparent", ItemManager.get_player())
		#position += Vector2(0,-20)
	
	pass # Replace with function body.

func throw():
	#print(get_tree().current_scene)
	ItemManager.get_player().get_child(0).remote_path = NodePath("")
	gravity_scale = 1
	var player_direction = ItemManager.get_player().get_direction()
	apply_impulse(Vector2(player_direction * 200, -600), position)
	
	call_deferred("set_disable_mode", DisableMode.DISABLE_MODE_KEEP_ACTIVE)
