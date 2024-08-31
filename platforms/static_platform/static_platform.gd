extends StaticBody2D

@onready var timer: Timer = $Timer
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var trigger_shape: CollisionShape2D = $Area2D/CollisionShape2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	timer.start()
