extends Area2D

@onready var initial_camera: Camera2D = $"../InitialCamera"
@onready var progress_barrier: StaticBody2D = $"../ProgressBarrier"


func _on_body_entered(_body: Node2D) -> void:
	var hit_counter : int = 0
	var max_hits : int = 4
	if hit_counter < max_hits:
		hit_counter += 1
	else:
		progress_barrier.queue_free()
		initial_camera.set("enabled", false)
		self.queue_free()
