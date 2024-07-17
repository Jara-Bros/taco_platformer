extends Node


@onready var enemy_spawner: Node2D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready():
	animation_player.play("spawn")

func instance_cocobird():
	var cocobird = load("res://enemies/cocobird/cocobird.tscn").instantiate()
	add_child(cocobird)
