extends Node2D

@export var mob_scene : PackedScene

@onready var path : Path2D = $Path2D
@onready var pathFollow : PathFollow2D = $Path2D/PathFollow2D
@export var curve : Curve2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	path.curve = curve
	 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	 
	pathFollow.progress += 50* delta
	print(pathFollow.position)
	position = pathFollow.position + Vector2(0,150)
	pass


func _on_timer_timeout() -> void:
	var mob_instance = mob_scene.instantiate()
	add_child(mob_instance)
	pass # Replace with function body.
