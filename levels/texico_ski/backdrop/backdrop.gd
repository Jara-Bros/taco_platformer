extends Node2D

@export var chip : PackedScene
@export var obstacle : PackedScene
@export var generate : bool = true
var spawn_region: Rect2
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_region =$Spawnrect.get_rect()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func pause():
	paused = true
func unpause():
	paused = false
	
func _on_timer_timeout():
	if generate == true and paused == false:
		var chip_instance = chip.instantiate()
		var rand_x = randi_range(spawn_region.get_center().x - 160, spawn_region.get_center().x + 160)
		var rand_y = randi_range(spawn_region.get_center().y -20, spawn_region.get_center().y + 20)
		chip_instance.position = Vector2(rand_x, rand_y)
		get_tree().current_scene.add_child(chip_instance)
	
	pass # Replace with function body.
