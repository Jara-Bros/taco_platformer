extends Area2D

var player : Player = null
@export var full : bool = false
var collected : bool = false
var collect_tween : Tween
var invincible : bool = false
var dropped : bool = false
var ingredients = []
@export var on_conveyer: bool
var start_position: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = position
	$Label.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("item") and collected == false and $Label.visible and ItemManager.get_items_list() == 0:
		item_tween()
	if Input.is_action_just_pressed("item") and collected == true and invincible == false:
		lock_to_conveyer_belt()
	if player != null and get_overlapping_bodies().has(player)and ingredients.size() > 0:
		$Label.visible = true
	
	#if dropped == true:
		#position.y += 50 * delta
	#
	
	if collected == true and invincible == false:
		position = player.position + Vector2(0, -40) 
	if on_conveyer:
		position.x += 50 * delta

	
func item_tween():
	invincible = true
	collect_tween = create_tween()
	collect_tween.connect("finished", tween_complete)
	set_collision_layer_value(4, false)
	collected = true
	collect_tween.tween_property(self, "position", player.position + Vector2(0, -40), 0.3)


func tween_complete():
	set_collision_layer_value(4, true)
	invincible = false



func lock_to_conveyer_belt():
	collected = false
	position = player.position

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body
	if body.is_in_group("salad_item"):
		add_ingredient(body)
		
	
		
	
	# do this to initiate glowing sequence
		if ingredients.size() > 3:
			full = true
	
func add_ingredient(body):
	if full == false:
		
		ingredients.append(body.current_type)
		body.queue_free()
		var bowl_hud = get_tree().get_first_node_in_group("bowl_hud")
		if body.current_type == "KALE":
			bowl_hud.increment_kale()
		elif body.current_type == "CHEESE":
			bowl_hud.increment_cheese()
		else:
			bowl_hud.increment_tomato()
	
func get_ingredients_in_bowl():
	return ingredients

func clear():
	ingredients.clear()
	full = false

func _on_body_exited(body):
	$Label.visible = false

# when the bowl is full, we dont want it to listen to 
# items since otherwise it 
func disable_salad_item_collision():
	pass

func reset_bowl():
	position = start_position
	ingredients = []
	var bowl_hud = get_tree().get_first_node_in_group("bowl_hud")
	bowl_hud.clear()
	
