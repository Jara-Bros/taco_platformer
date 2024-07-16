extends Area2D

@onready var bear_growl: AudioStreamPlayer = $BearGrowl
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _on_body_entered(body: Node2D) -> void:
	bear_growl.play()
	collision_shape_2d.queue_free()
