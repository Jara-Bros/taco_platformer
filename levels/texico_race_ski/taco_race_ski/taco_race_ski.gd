extends CharacterBody2D


const JUMP_VELOCITY = -400.0

var is_stunned : bool = false

@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.


	move_and_slide()

func spin_out():
	animation_player.play("spin_out")
	is_stunned = true
	$StunnedTimer.start()
	
	


func _on_stunned_timer_timeout():
	is_stunned = false
	pass # Replace with function body.
