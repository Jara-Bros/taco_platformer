extends Area2D

var player : Node2D = null
@export var ranch_node : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if player != null:
		if player.velocity.y > 50:
			player.velocity.y = 50
		else:
			if player.velocity.y < 0:
				player.velocity.y += 50 * delta
			else:
				player.velocity.y = 50


	if Input.is_action_just_pressed("jump") and player != null:
		player.bounce(1.25)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		if player.get_children().filter(func (node): return node.is_in_group("status")).size() == 0:
			var ranch_instance = ranch_node.instantiate()
			player.add_child(ranch_instance)
	pass # Replace with function body.


func _on_body_exited(_body: Node2D) -> void:
	player = null
