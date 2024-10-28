extends AnimatableBody2D


@onready var raycast_l: RayCast2D = $RayCastLeft
@onready var raycast_r: RayCast2D = $RayCastRight
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@export var rotation_speed: int


# X & Y must be equal
@export var collision_scale_multiple := Vector2(1, 1)

@export_enum("Left:-1", "Right:1") var rotation_direction: int


func _ready() -> void:
	collision_shape.scale *= collision_scale_multiple


func _process(delta: float) -> void:
	if raycast_l.is_colliding():
		rotation -= rotation_speed * delta
		
	if raycast_r.is_colliding():
		rotation += rotation_speed * delta


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
