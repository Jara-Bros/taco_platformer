extends Area2D

@onready var kale_leaf = preload("res://white_box/salad_dream/kale_leaf.tscn")

func _on_body_entered(body: Node2D) -> void:
	var leaf = kale_leaf.instantiate()
	leaf.position = position
	get_parent().call_deferred("add_child", leaf)
