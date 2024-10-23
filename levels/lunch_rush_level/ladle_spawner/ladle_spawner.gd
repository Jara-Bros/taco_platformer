extends Node2D

@onready var ladle: RigidBody2D = $Ladle


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ladle_pos = ladle.get_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	var max_child_count : int = 1
	if get_child_count() <= max_child_count:
		var new_ladle = load("res://platforms/falling_spoon/spoon.tscn").instantiate()
	
	if body.is_in_group("Utensil"):
		body.reset_transform
