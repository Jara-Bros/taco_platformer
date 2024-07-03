extends CharacterBody2D


var speed = 800.0

func _physics_process(_delta: float) -> void:
	
	move_and_slide()


func _on_timer_timeout() -> void:
	velocity.x = speed
