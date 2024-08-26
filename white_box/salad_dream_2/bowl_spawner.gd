extends Node2D

@export var bowl_scene : PackedScene

var has_bowl = true

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_bowl = bowl_scene.instantiate()
	add_child(new_bowl)
	new_bowl.position += Vector2(0,-50)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
