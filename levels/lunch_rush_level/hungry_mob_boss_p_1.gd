extends Node2D

@onready var ray_cast: RayCast2D = $Path2D/PathFollow2D/AnimatableBody2D/RayCast2D
@onready var anim_player: AnimationPlayer = $Path2D/AnimationPlayer


func _ready() -> void:
	pass



func _process(delta: float) -> void:
	
	
	
	# Trigger falling platforms
	# TODO: Set timer to delay falling plat
	if ray_cast.is_colliding():
		anim_player.play("move_block")
