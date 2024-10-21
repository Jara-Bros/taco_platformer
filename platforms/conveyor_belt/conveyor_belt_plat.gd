extends AnimatableBody2D


@export var move_speed : float

@export_group("Move Direction")
@export var left : bool = false
@export var right : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if left == false && right == false:
		printerr("Choose a direction")
	elif left == true && right == false:
		position.x -= move_speed * delta
	elif right == true && left == false:
		position.x += move_speed * delta
	elif left == true && right == true:
		printerr("Choose ONE direction")
	
	
	
