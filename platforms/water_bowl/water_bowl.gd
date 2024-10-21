extends Area2D

var player : Node2D = null
@export var ranch_node : PackedScene
@export var is_water : bool = false

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
		#move_toward(player.velocity.y, -450, 20)
		player.velocity.y = -450

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		if is_water:
			for node in body.get_children():
				if node.is_in_group("status"):
					body.remove_child(node)
		else:
			if player.get_children().filter(func (node): return node.is_in_group("status")).size() == 0:
				var ranch_instance = ranch_node.instantiate()
				player.add_child(ranch_instance)
	pass # Replace with function body.


func _on_body_exited(_body: Node2D) -> void:
	player = null
