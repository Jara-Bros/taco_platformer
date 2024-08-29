extends Node2D

@onready var order_ticket_no_chz = preload("res://white_box/salad_dream/order_ticket_no_chz.tscn")
@onready var order_ticket_xdressing = preload("res://white_box/salad_dream/order_ticket_xdressing.tscn")
@onready var order_ticket_xchz = preload("res://white_box/salad_dream/order_ticket_xchz.tscn")
@onready var order_ticket_no_dressing = preload("res://white_box/salad_dream/order_ticket_no_dressing.tscn")
@onready var order_ticket_no_kale = preload("res://white_box/salad_dream/order_ticket_no_kale.tscn")

# var order_dictionary = {}

func _on_timer_timeout() -> void:
	
	var order_number: int = randi_range(0, 4)
	
	match order_number:
		0:
			var no_chz = order_ticket_no_chz.instantiate()
			get_child(1).add_child(no_chz)
		1:
			var xdressing = order_ticket_xdressing.instantiate()
			get_child(1).add_child(xdressing)
		2:
			var xchz = order_ticket_xchz.instantiate()
			get_child(1).add_child(xchz)
		3:
			var no_dressing = order_ticket_no_dressing.instantiate()
			get_child(1).add_child(no_dressing)
		4:
			var no_kale = order_ticket_no_kale.instantiate()
			get_child(1).add_child(no_kale)
