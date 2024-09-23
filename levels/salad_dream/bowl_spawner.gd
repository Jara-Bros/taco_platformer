extends Node2D

@onready var salad_bowl = preload("res://white_box/salad_dream/salad_bowl.tscn")


func _on_timer_timeout() -> void:
	var bowl = salad_bowl.instantiate()
	bowl.position = position
	get_parent().add_child(bowl)
