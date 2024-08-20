extends Area2D

@onready var salad_sprite: AnimatedSprite2D = $"../../../SaladBowl/AnimatedSprite2D"

func _on_body_entered(body: Node2D) -> void:
	if salad_sprite.frame == 0:
		salad_sprite.frame = 5
	elif salad_sprite.frame == 1:
		salad_sprite.frame = 2
	elif salad_sprite.frame == 3:
		salad_sprite.frame = 4
	elif salad_sprite.frame == 6:
		salad_sprite.frame = 7
	else:
		pass
