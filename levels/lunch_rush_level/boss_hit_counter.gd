extends Area2D

@onready var initial_camera: Camera2D = $"../InitialCamera"
@onready var progress_barrier: StaticBody2D = $"../ProgressBarrier"

var hit_counter : int = 0


func _on_body_entered(_body: Node2D) -> void:
	if hit_counter < 4:
		hit_counter += 1
	else:
		progress_barrier.queue_free()
		initial_camera.set("enabled", false)
		self.queue_free()
