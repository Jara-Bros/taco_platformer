extends StaticBody2D

## The OrderManager/order_area system is a variation of the InteractionManager/
## interaction_area system. The Order Checker serves as a "Interaction Area".
## The "players" are the ingredients.

@onready var order_line: HFlowContainer = $"../OrderLine"

func _on_body_entered(body: Node2D) -> void:
	order_line.get_child(get_child_count()).queue_free()
	queue_free()
