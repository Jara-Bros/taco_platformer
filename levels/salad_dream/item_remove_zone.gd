extends Area2D

@onready var kale_box: StaticBody2D = $"../IngredientBoxes/KaleBox"
@onready var dressing_box: StaticBody2D = $"../IngredientBoxes/DressingBox"
@onready var cheese_box: StaticBody2D = $"../IngredientBoxes/CheeseBox"

## TODO
# Get the spawned items that miss the salad bowl to queue free at the item zone.

func _on_body_entered(body: Node2D) -> void:
	var item = kale_box.get_child(get_child_count())
	if item is RigidBody2D:
		item.queue_free()
	else:
		pass
