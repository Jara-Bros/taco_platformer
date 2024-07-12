extends Path2D

@export var speed : float = 1.0
@export var speed_scale : float = 1.0

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	pass
