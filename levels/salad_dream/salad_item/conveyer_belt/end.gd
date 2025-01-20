extends Area2D


@export var hud_scene: PackedScene


@onready var good_sfx: AudioStreamPlayer2D = $GoodSFX
@onready var bad_sfx: AudioStreamPlayer2D = $BadSFX


func _ready():
	pass # Replace with function body.



func _process(delta):
	pass
	

func _on_area_entered(area):
	if area.is_in_group("bowl") and area.collected == false:
		var tickets = get_tree().get_nodes_in_group("ticket")
		var ticket_found = null
		for ticket in tickets:
			var ingredients = area.get_ingredients_in_bowl()
			if ticket.compare_ticket_ingredients(ingredients):
				ticket_found = ticket
				break
		#area.queue_free()
		var hud = hud_scene.instantiate()
		if ticket_found != null:
			ticket_found.queue_free()
			
			hud.set_type("GOOD")
			good_sfx.play()
		else:
			hud.set_type("BAD")
			bad_sfx.play()
		
		area.reset_bowl()
		get_tree().current_scene.add_child(hud)

	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Label.visible = true
	
	if body.is_in_group("salad_item"):
		body.queue_free()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Label.visible = false
