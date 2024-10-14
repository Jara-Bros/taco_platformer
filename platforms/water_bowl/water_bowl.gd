extends Area2D

var player : Node2D = null
@export var ranch_node : PackedScene

var bouncing_velocity = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player != null:
		print(player.velocity.y) 
		if player.velocity.y > 50:
			player.velocity.y = 50
		else:
			if player.velocity.y < 0:
				player.velocity.y += 200 * delta
			else:
				player.velocity.y = 50

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and player != null:
		player.bounce(2)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player = body
		player.ignore_gravity = true
		if player.get_children().filter(func (node): return node.is_in_group("status")).size() == 0:
			var ranch_instance = ranch_node.instantiate()
			player.add_child(ranch_instance)
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	player.ignore_gravity = false
	player = null
	pass # Replace with function body.
	
