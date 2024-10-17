extends RayCast2D


func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	
	if is_colliding():
		jump()
		random_direction()
		release_jump()
		
		
# The following functions simulate input
func jump():
	Input.action_press("jump")

func release_jump():
	Input.action_release("jump")
	
func random_direction():
	var num = randi_range(0,1)
	
	match(num):
		
		0:
			move_left_pressed()
			move_left_released()
		
		1:
			move_right_pressed()
			move_right_released()


func move_left_pressed():
	Input.action_press("move_left")
	
func move_left_released():
	Input.action_release("move_left")
	
func move_right_pressed():
	Input.action_press("move_right")
	
func move_right_released():
	Input.action_release("move_right")
