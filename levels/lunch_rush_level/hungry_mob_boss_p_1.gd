extends Node2D

@onready var anim_player: AnimationPlayer = $FallPlatform/Path2D/PathFollow2D/AnimatableBody2D/AnimationPlayer
@onready var ray_cast: RayCast2D = $FallPlatform/Path2D/PathFollow2D/AnimatableBody2D/RayCast2D
@onready var anim_player_2: AnimationPlayer = $FallPlatform/Path2D2/PathFollow2D/AnimatableBody2D/AnimationPlayer
@onready var ray_cast_2: RayCast2D = $FallPlatform/Path2D2/PathFollow2D/AnimatableBody2D/RayCast2D


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	
	# Trigger falling platforms
	if ray_cast.is_colliding():
			anim_player.play("fall_block")
	if ray_cast_2.is_colliding():
		anim_player_2.play("fall_block")
