extends CharacterBody2D


@onready var animation_player:AnimationPlayer
@onready var low_raycast = $RayCast2D
@onready var high_raycast = $RayCast2D2

var is_stunned : bool = false
var track
var random = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is AnimationPlayer:
			animation_player = child
			



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if (low_raycast.is_colliding() or high_raycast.is_colliding()) and is_on_floor():
		if low_raycast.is_colliding() and low_raycast.get_collider() != null and low_raycast.get_collider().is_in_group("nacho_boulder"):
			var jump_choice = [0, 1]
			var probabilities = [0.5, 2]
			if jump_choice[random.rand_weighted(probabilities)] == 1:
				velocity.y = -400
		elif (low_raycast.is_colliding() and low_raycast.get_collider() != null and low_raycast.get_collider().is_in_group("flying_object")):
			var will_jump = randi_range(0,1)
			if will_jump == 1:
				velocity.y = -400
		elif (high_raycast.is_colliding() and high_raycast.get_collider() != null and high_raycast.get_collider().is_in_group("flying_object")):
			var will_jump = randi_range(0,1)
			if will_jump == 1:
				velocity.y = -400
			
	move_and_slide()



func spin_out():
	animation_player.play("spin_out")
	is_stunned = true
	$StunnedTimer.start()


func _on_stunned_timer_timeout():
	is_stunned = false
	pass # Replace with function body.
	
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
	$AnimationPlayer.play("speed_up")
