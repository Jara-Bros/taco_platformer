extends CharacterBody2D

@export var speed : int = 50

func _physics_process(delta: float) -> void:

	# Input for vertical movement
	var direction_vertical := Input.get_axis("ui_up", "ui_down")
	if direction_vertical:
		velocity.y = direction_vertical * speed
	else:
		velocity.y = move_toward(0, velocity.y, 0)
	
	var direction_horizontal = speed
	if direction_horizontal:
		velocity.x = direction_horizontal * -1
	else:
		velocity.x = move_toward(velocity.x, 0, 0)

	move_and_slide()
