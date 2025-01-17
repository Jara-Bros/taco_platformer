extends Node2D

@export var tutorial_hud : PackedScene
var first_time = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_chip_start_trick_first_time():
	var tutorial_hud_instance = tutorial_hud.instantiate()
	get_tree().current_scene.add_child(tutorial_hud_instance)
	get_tree().call_group("pause", "pause")
	
	pass # Replace with function body.
