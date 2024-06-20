extends RigidBody2D


var starting_point
enum direction {left,right}
var current_direction = direction.left
var is_moving
@export var jump_velocity_y : int
@export var jump_velocity_x : int
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Direction.start()
	$Jumping.start()
	is_moving = true
	starting_point = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	pass


func move(delta):
	if is_moving == true:
		if current_direction == direction.left:
			position.x -= 40 * delta
		else:
			position.x += 40 * delta
		flip()

func change_movement():
	var next_move = randi_range(-100, 100)
	if next_move < 0:
		current_direction = direction.left
	else:
		current_direction = direction.right 
	

func flip():
	if position.x <= starting_point.x - 40:
		current_direction = direction.right
	elif position.x >= starting_point.x + 40:
		current_direction = direction.left
	
	



func _on_body_entered(body):
	if body.get_name() != "Taco":
		return
	#if body.position.y < position.y:
		#queue_free()
	#else:
		#body.queue_free()


func _on_jumping_timeout():
	if current_direction == direction.left:
		apply_impulse(Vector2(-jump_velocity_x,jump_velocity_y), to_global(position))
	else:
		apply_impulse(Vector2(jump_velocity_x,jump_velocity_y), to_global(position))
	$Jumping.start()


func _on_direction_timeout():
	change_movement()
	$Direction.wait_time = randi() % 3 + 1
	is_moving = !is_moving
	$Direction.start()
