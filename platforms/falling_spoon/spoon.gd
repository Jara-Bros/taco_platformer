extends RigidBody2D

@onready var ray_cast: RayCast2D = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if ray_cast.is_colliding():
		apply_impulse(Vector2(0, -3), Vector2(2, 1))
