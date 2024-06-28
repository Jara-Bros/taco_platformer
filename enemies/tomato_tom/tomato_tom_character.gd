extends CharacterBody2D


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft


@export var speed : int
@export var jump_velocity : int

func _ready():
	
	# Randomizes the sprite color
	var sprite_color = randi_range(1, 3) 
	match sprite_color:
		1:
			sprite_2d.frame = 0
		2:
			sprite_2d.frame = 1
		3:
			sprite_2d.frame = 2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor_only():
		velocity += get_gravity() * delta

	# Handles and randomizes jump.
	if is_on_floor_only():
		var num = randi_range(0, 10000)
		var direction = randi_range(0, 1)
		if (num % 3 == 0) && (num % 7 == 0) && (direction == 0):
			velocity.x = speed
			velocity.y = jump_velocity
			
		elif (num % 3 == 0) && (num % 7 == 0) && (direction == 1):
			velocity.x = -1 * speed
			velocity.y = jump_velocity
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

	# Flip sprites
	if velocity.x > 0:
		sprite_2d.flip_h = false
	if velocity.x < 0:
		sprite_2d.flip_h = true
	else:
		pass
	
	# Checks for ledges
	if ray_cast_left.is_colliding():
		pass
	else:
		velocity.x = speed * -1
	
	if ray_cast_right.is_colliding():
		pass
	else:
		velocity.x = speed * -1
	

	move_and_slide()


func _on_hit_box_body_entered(_body: Node2D) -> void:
	queue_free()
