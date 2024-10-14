extends Node2D

var player : Node2D = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent().is_in_group("Player"):
		player = get_parent()
		player.GRAVITY = 1750
		player.speed = 100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _on_tree_exiting() -> void:
	player.GRAVITY = 980
	player.speed = 200
	pass # Replace with function body.
