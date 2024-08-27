extends Area2D
class_name OrderArea

## The OrderManager/order_area system is a variation of the InteractionManager/
## interaction_area system. The Order Checker serves as a "Interaction Area".
## The "players" are the ingredients.

# Ingredient name that appears on order
@export var action_name: String = "ingredient"

var interact: Callable = func():
	pass
	
	
func _on_body_entered(body: Node2D) -> void:
	OrderManager.register_area(self)


func _on_body_exited(body: Node2D) -> void:
	OrderManager.unregister_area(self)
