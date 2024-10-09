extends Node2D


@onready var ray_cast: RayCast2D = $Taco/RayCast2D
@onready var taco: Player = $Taco
@onready var collision_shape: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var restore_platform_timer: Timer = $RestorePlatformTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	# When raycast hits a "drop down platform"
	# and button down is pressed
	# disable platform's collision shape
	if ray_cast.is_colliding():
		if Input.is_action_just_pressed("move_down"):
			collision_shape.disabled = true
			restore_platform_timer.start()
			


func _on_restore_platform_timer_timeout() -> void:
	collision_shape.disabled = false
