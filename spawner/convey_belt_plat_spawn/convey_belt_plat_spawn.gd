extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func init_platform():
	var conveyor_belt = load("res://platforms/conveyor_belt/conveyor_belt_plat.tscn").instantiate()
	add_child(conveyor_belt)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ConveyorBelt"):
		body.queue_free()
