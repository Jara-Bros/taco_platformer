extends Sprite2D

@onready var taco: Player = $"../Taco"



func _on_area_2d_body_entered(body: Node2D) -> void:
	print_debug("u hit me")
	taco.animation_player.play("look_forward")
	
