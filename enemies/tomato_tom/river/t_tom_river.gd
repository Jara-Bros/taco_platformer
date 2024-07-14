extends CharacterBody2D


@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	
	# Randomizes the sprite color
	var sprite_color = randi_range(1, 3) 
	match sprite_color:
		1:
			sprite_2d.frame = 0
		2:
			sprite_2d.frame = 1
		3:
			sprite_2d.frame = 2
