extends Area2D

@onready var block_hit_box: StaticBody2D = $BlockHitBox


func _on_body_entered(body: Node2D) -> void:
	block_hit_box.queue_free()
