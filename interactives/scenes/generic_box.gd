class_name GenericBox extends Area2D

@export var transformation_node : String
@export var spawn_location: Vector2
@export var player_removal_node : Node2D
@export var sprite_2d_image  : Texture
@onready var sprite_2d_node = $Sprite2D


func _ready():
	sprite_2d_node.texture = sprite_2d_image


func _process(delta):
	pass


func _on_body_entered(body):
	if transformation_node != null:
		var instantiated_node = load(transformation_node).instantiate()
		if spawn_location == Vector2(0,0):
			instantiated_node.position = global_position
		else:	
			instantiated_node.position = spawn_location
		get_parent().call_deferred("add_child", instantiated_node)

	
	if player_removal_node != null:
		get_parent().remove_child(player_removal_node)
	
	if player_removal_node == null:
		get_tree().get_first_node_in_group("transformation").queue_free()
