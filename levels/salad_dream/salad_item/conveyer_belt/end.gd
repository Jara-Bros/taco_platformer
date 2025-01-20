extends Area2D


@export var hud_scene: PackedScene

@onready var good_sfx: AudioStreamPlayer2D = $GoodSFX
@onready var bad_sfx: AudioStreamPlayer2D = $BadSFX


var total_orders : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
			total_orders += 1
			good_sfx.play()
		else:
			hud.set_type("BAD")
			bad_sfx.play()
		
		area.reset_bowl()
		get_tree().current_scene.add_child(hud)


	if total_orders == 3:
		Dialogic.start("sous_salad_rush")
		

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Label.visible = true
	
	if body.is_in_group("salad_item"):
		body.queue_free()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Label.visible = false
