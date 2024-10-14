extends Node2D

@onready var player_ray_cast: RayCast2D = $Path2D/PathFollow2D/AnimatableBody2D/PlayerRayCast
@onready var anim_player: AnimationPlayer = $Path2D/PathFollow2D/AnimationPlayer

@onready var plat_ray_cast: RayCast2D = $Path2D/PathFollow2D/AnimatableBody2D/PlatRayCast

func _process(_delta: float) -> void:
	
	# When player is on the block, move block
	if player_ray_cast.is_colliding():
		anim_player.play("move_block")
	
	if plat_ray_cast.is_colliding():
			anim_player.pause()
			player_ray_cast.enabled = false
