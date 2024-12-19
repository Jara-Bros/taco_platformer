extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_impulse(Vector2(450,-450))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Land"):
		queue_free()
	pass # Replace with function body.
