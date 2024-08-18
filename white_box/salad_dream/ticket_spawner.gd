extends Node2D

@onready var order_ticket = preload("res://white_box/salad_dream/order_ticket.tscn")

func _on_timer_timeout() -> void:
	var ticket = order_ticket.instantiate()
	ticket.position = position
	get_parent().add_child(ticket)
