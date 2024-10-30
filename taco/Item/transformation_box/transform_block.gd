extends Area2D


@export var type = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#TODO Figure out how to transform Taco into a cube & attach to scene tree
# without acquiring parent position from animatablebody2D
func _on_body_entered(body):
	if body.get_name() == "Taco":
		get_tree().call_group("Player", "transform_node")
		var instanced_transformation = load(type).instantiate()
		get_parent().call_deferred("add_child", instanced_transformation)
		body.queue_free()
		queue_free()
	pass # Replace with function body.
