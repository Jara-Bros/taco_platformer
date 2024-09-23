extends Area2D

@onready var dressing_drops = preload("res://white_box/salad_dream/dressing_drops.tscn")

func _on_body_entered(_body: Node2D) -> void:
	
	for i in range(3):
		var drops = dressing_drops.instantiate()
		drops.position = position
		get_parent().call_deferred("add_child", drops)
