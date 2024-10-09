extends Node2D

@onready var camera2d = $Camera2D
@onready var path = $Path2D/PathFollow2D
@onready var mob_boss = $MobBoss
@export var camera_speed : int 
var offset = Vector2(0, -20)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera2d.position = path.position + offset
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path.progress += camera_speed * delta
	camera2d.position = path.position + offset
	mob_boss.position = path.position + Vector2(-240, 0)
	pass
