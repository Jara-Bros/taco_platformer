extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var big_wing_flap: AudioStreamPlayer = $BigWingFlap
@onready var timer: Timer = $Timer
@onready var jungle_level: Node2D = $".."

@onready var animation_player: AnimationPlayer = $ButterflyRide/AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	

func _on_timer_timeout() -> void:
	collision_shape_2d.queue_free()
	big_wing_flap.play()
	animation_player.play("move")

func change_scenes():
	var river = load("res://levels/river/river.tscn").instantiate()
	river.get_child(0).position = river.get_spawn_location("butterfly_enter")
	SceneManager.change_scenes(river)
	jungle_level.queue_free()
	
