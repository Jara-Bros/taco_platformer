extends Area2D


@export var hud_scene: PackedScene


@onready var good_sfx: AudioStreamPlayer2D = $GoodSFX
@onready var bad_sfx: AudioStreamPlayer2D = $BadSFX
var bowl = null

func _ready():
	pass # Replace with function body.



func _process(delta):
	if Input.is_action_just_pressed("item") and bowl != null:
		complete_order()
	
func complete_order():
	bowl.collected = false
	var tickets = get_tree().get_nodes_in_group("ticket")
	var ticket_found = null
	for ticket in tickets:
		var ingredients = bowl.get_ingredients_in_bowl()
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
		
	bowl.reset_bowl()
	get_tree().current_scene.add_child(hud)
func _on_area_entered(area):
	if area.is_in_group("bowl"):
		bowl = area

	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Label.visible = true
	
	if body.is_in_group("salad_item"):
		body.queue_free()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Label.visible = false


func _on_area_exited(area):
	if area.is_in_group("bowl"):
		bowl = null
	pass # Replace with function body.
