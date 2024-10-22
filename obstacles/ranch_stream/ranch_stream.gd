extends Area2D

@export var ranch_packed_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var ranch_node = ranch_packed_scene.instantiate()
		body.add_child(ranch_node)
	pass # Replace with function body.
