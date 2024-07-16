extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var big_wing_flap: AudioStreamPlayer = $BigWingFlap
@onready var timer: Timer = $Timer

@onready var animation_player: AnimationPlayer = $ButterflyRide/AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	

func _on_timer_timeout() -> void:
	collision_shape_2d.queue_free()
	big_wing_flap.play()
	animation_player.play("move")
