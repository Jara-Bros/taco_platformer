extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var screen_size

func _ready():
	screen_size = get_viewport_rect().size


func _process(delta: float) -> void:
	# Add the gravity.
	# if not is_on_floor():
		# velocity += get_gravity() * delta

	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += SPEED
	if Input.is_action_pressed("move_left"):
		velocity.x -= SPEED
	if Input.is_action_pressed("move_down"):
		velocity.y += SPEED
	if Input.is_action_pressed("move_up"):
		velocity.y -= SPEED
		
	if Input.is_action_just_pressed("item"):
		shoot()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
#
func shoot():
	var bullet_up_instance = Bullet.new_bullet(10)
	var bullet_middle_istance = Bullet.new_bullet(0)
	var bullet_down_istance = Bullet.new_bullet(-10)
	add_child(bullet_up_instance)
	add_child(bullet_middle_istance)
	add_child(bullet_down_istance)
