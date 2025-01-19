extends CharacterBody2D


const JUMP_VELOCITY = -400.0

var is_stunned : bool = false
@onready var animation_player = $AnimationPlayer
var track
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
func move_back():
	var gt = global_transform
	var track_gt = track.global_transform
	var local_transform: Transform2D = track_gt.affine_inverse()
	var relative_position = local_transform * gt.origin
	relative_position = Vector2(relative_position.x - 25, relative_position.y)
	var t_global_position = track_gt * relative_position
	var pos_tween = create_tween()
	pos_tween.tween_property(self, "position", t_global_position, 0.5)
	#global_position = t_global_position
	
func bounce():
	velocity.y = -300

func move_forward():
	var gt = global_transform
	var track_gt = track.global_transform
	var local_transform: Transform2D = track_gt.affine_inverse()
	var relative_position = local_transform * gt.origin
	relative_position = Vector2(relative_position.x + 25, relative_position.y)
	var t_global_position = track_gt * relative_position
	var pos_tween = create_tween()
	pos_tween.tween_property(self, "position", t_global_position, 0.5)

	
	


func _on_stunned_timer_timeout():
	is_stunned = false
	pass # Replace with function body.
