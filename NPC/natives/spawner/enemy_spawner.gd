extends Node


@onready var enemy_spawner: Node2D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready():
	animation_player.play("spawn")
