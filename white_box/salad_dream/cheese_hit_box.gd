extends Area2D

@onready var shredded_cheese = preload("res://white_box/salad_dream/cheese.tscn")

func _on_body_entered(body: Node2D) -> void:
	var cheese = shredded_cheese.instantiate()
	cheese.position = position
	get_parent().call_deferred("add_child", cheese)
