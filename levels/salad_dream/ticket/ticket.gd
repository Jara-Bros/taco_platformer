class_name Ticket extends Control

# 0 == 
var possible_ingredients_map = {
	0: "KALE",
	1: "CHEESE",
	2: "TOMATOES"
}
var ingredients	 = []
# Called when the node enters the scene tree for the first time.
func _ready():
	# max size of ingredients on ticket: 3
	var ingrediants_size = randi_range(1,3)
	for i in ingrediants_size:
		var random_ingredient = randi_range(0,2)
		ingredients.append(possible_ingredients_map.get(random_ingredient))
	for ing in ingredients:
		add_ingredient_to_ticket(ing)

func add_ingredient_to_ticket(text):
	var label = Label.new()
	label.text = text 
	label.add_theme_font_size_override("font_size", 6)
	label.add_theme_color_override("font_color", Color.BLACK)
	var vBox = VBoxContainer.new()
	vBox.add_child(label)
	$ColorRect/MainContainer.add_child(vBox)

func get_ticket_ingredients():
	return ingredients

func compare_ticket_ingredients(other):
	for ing in ingredients:
		if ing not in other:
			return false
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
