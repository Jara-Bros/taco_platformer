extends HFlowContainer

@onready var order_ticket = preload("res://white_box/salad_dream/order_ticket.tscn")


func _on_timer_timeout() -> void:
	var ticket = order_ticket.instantiate()
	call_deferred("add_child", ticket)
