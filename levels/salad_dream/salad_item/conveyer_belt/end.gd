extends Area2D

@export var hud_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	





func _on_area_entered(area):
	if area.is_in_group("bowl"):
		var tickets = get_tree().get_nodes_in_group("ticket")
		var ticket_found = null
		for ticket in tickets:
			var ingredients = area.get_ingredients_in_bowl()
			if ticket.compare_ticket_ingredients(ingredients):
				ticket_found = ticket
		area.queue_free()
		var hud = hud_scene.instantiate()
		if ticket_found != null:
			ticket_found.queue_free()
			
			hud.set_type("GOOD")
		else:
			hud.set_type("BAD")
		
		
		get_tree().current_scene.add_child(hud)
