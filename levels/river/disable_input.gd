extends Area2D

@onready var taco: Player = $"../Taco"
@onready var animation_player: AnimationPlayer = $"../Taco/AnimationPlayer"
@onready var animation_player_boat: AnimationPlayer = $"../PlaintainBoat/AnimationPlayer"
@onready var plaintain_boat: Path2D = $"../PlaintainBoat"

func _on_body_entered(body: Node2D) -> void:
	animation_player_boat.play("move")
