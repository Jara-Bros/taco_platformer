extends Node2D

@onready var ray_cast: RayCast2D = $Path2D/PathFollow2D/AnimatableBody2D/RayCast2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast.is_colliding():
		anim_player.play("move_block")
