extends RigidBody2D

# The force when Taco steps on spoon
# Usually negative to push it up
@export var y_impulse = 0

@onready var ray_cast: RayCast2D = $RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	
	
	if ray_cast.is_colliding() && rotation_degrees >= 20:
		y_impulse = -4
		apply_impulse(Vector2(0, y_impulse), Vector2(0, 0))
	elif ray_cast.is_colliding() && rotation_degrees < 20:
		y_impulse = 0
