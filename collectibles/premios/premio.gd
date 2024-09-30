extends RigidBody2D

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	var color = randi_range(0,2)
	
	match color:
		0:
			sprite.frame = 0
		1:
			sprite.frame = 1
		2:
			sprite.frame = 2
		
