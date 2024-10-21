extends Node2D


@export_group("Platform Direction")
@export var move_left : bool = false
@export var move_right : bool = false


var conveyor_belt_plat : Node2D


# Plate is a conveyor belt plat instance.
# Needs a custom speed

@export var plate_speed : int = 700


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func init_platform():
	conveyor_belt_plat = load("res://platforms/conveyor_belt/conveyor_belt_plat.tscn").instantiate()
	add_child(conveyor_belt_plat)
	platform_direction()


func init_plate():
	conveyor_belt_plat = load("res://platforms/conveyor_belt/conveyor_belt_plat.tscn").instantiate()
	add_child(conveyor_belt_plat)
	conveyor_belt_plat.move_speed = plate_speed
	platform_direction()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ConveyorBelt"):
		body.queue_free()


func platform_direction():
	if move_left == true && move_right == false:
		conveyor_belt_plat.left = true
	elif move_right == true && move_left == false:
		conveyor_belt_plat.right = true
	elif move_right == true && move_right == true:
		printerr("Choose ONE direction")
	elif move_right == false && move_right == false:
		printerr("Choose a direction")
