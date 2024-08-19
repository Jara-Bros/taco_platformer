extends Area2D

@onready var salad_sprite: AnimatedSprite2D = $"../../../SaladBowl/AnimatedSprite2D"



func _on_body_entered(body: Node2D) -> void:
	salad_sprite.frame = 1
