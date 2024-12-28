extends Area2D

@export var salad_item_packed_scene : PackedScene
@export_enum("KALE", "LETTUCE", "TOMATOES") var type
#signal item_created(item)

# Called when the node enters the scene tree for the first time.
func _ready():
	if type == 0:
		$ColorRect.color = Color.GREEN
	elif type == 1:
		$ColorRect.color = Color.DARK_SEA_GREEN
	elif type == 2:
		$ColorRect.color = Color.RED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if(body.is_in_group("Player")):
		var salad_instance = salad_item_packed_scene.instantiate()
		salad_instance.set_item_type(type)
		salad_instance.position = position + Vector2(0, -100)
		#var item_list_size = ItemManager.get_items_list()
		#print(item_list_size)
		#if(item_list_size == 0):
			#salad_instance.offset = -40
		#else:
			#print(-40 * (item_list_size+1))
			#salad_instance.offset = -40 * (item_list_size+1)
	#	ItemManager.add_to_items_list(salad_instance)
		get_tree().current_scene.call_deferred("add_child", salad_instance)
	
