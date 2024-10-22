extends Node2D

@onready var taco: Player = $Taco

@onready var initial_camera: Camera2D = $KitchenEncounterSection/InitialCamera

func _ready() -> void:
	$GrillSection/Button.callable = func(fire_array):
		for grill_fire in fire_array:
			var grill_fire_node = get_node(grill_fire)
			grill_fire_node.queue_free()
	

func _process(_delta: float) -> void:
	pass
	


func _on_push_force_changed_body_entered(_body: Node2D) -> void:
	# To enable taco's push force for eight pans
	taco.push_force = 20


func _on_button_generic_signal() -> void:
	var taco_node = get_tree().get_nodes_in_group("Player")[0]
	taco_node.position = Vector2(3584, 416)
