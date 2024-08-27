extends Node2D

## The OrderManager/order_area system is a variation of the InteractionManager/
## interaction_area system. The Order Checker serves as a "Interaction Area".
## The "players" are the ingredients.

@onready var order_checker = get_tree().get_first_node_in_group("order_checker")
@onready var order_line: HFlowContainer = $OrderLine
@onready var label: Label = $Label

const base_text = "1 SALAD"

# An array of ingredients
var active_areas = []
var can_interact = true


func register_area(area: OrderArea):
	active_areas.push_back(area)


func unregister_area(area: OrderArea):
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)
	

##TODO
## Find a way to sort order areas by age.

# func _process(_delta):
	# if active_areas.size() > 0 && can_interact:
		# label.text = base_text + active_areas[0].action_name
		# label.global_position = active_areas[0].global_position
		# label.show()
	# else:
		# label.hide()
	
	
	
	
	
