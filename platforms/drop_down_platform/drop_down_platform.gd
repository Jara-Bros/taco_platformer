extends StaticBody2D

@onready var ray_cast: RayCast2D = $RayCast2D
@onready var collision_shape: CollisionPolygon2D = $"../../../Taco/CollisionShape2D"
@onready var taco: Player = $"../../../Taco"
@onready var body_restore_timer: Timer = $BodyRestoreTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	# When raycast hits "drop down platform" && button down is pressed,
	# disable platform's collision shape
	if ray_cast.is_colliding() && ray_cast.get_collider().body.is_in_group("Player"):
		if Input.is_action_just_pressed("move_down"):
			collision_shape.disabled = true
			body_restore_timer.start()


func _on_body_restore_timer_timeout() -> void:
	collision_shape.disabled = false
