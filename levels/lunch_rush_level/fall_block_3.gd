extends StaticBody2D

@onready var raycast: RayCast2D = $RayCast2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if raycast.is_colliding():
		collision_shape.set("disabled", true)
