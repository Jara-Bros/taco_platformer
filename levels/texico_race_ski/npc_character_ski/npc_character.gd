extends CharacterBody2D


@onready var animation_player:AnimationPlayer


var is_stunned : bool = false
var track
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is AnimationPlayer:
			animation_player = child
			



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jum
	if $RayCast2D.is_colliding() and is_on_floor():
		
		if $RayCast2D.get_collider().is_in_group("nacho_boulder"):
			var will_jump = randi_range(0,1)
			if will_jump == 1:
				velocity.y = -400
		elif $RayCast2D.get_collider().is_in_group("flying_object") and $RayCast2D.get_collider().is_high == false:
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
	
	

func move_forward():
	var gt = global_transform
	var track_gt = track.global_transform
	var local_transform: Transform2D = track_gt.affine_inverse()
	var relative_position = local_transform * gt.origin
	relative_position = Vector2(relative_position.x + 25, relative_position.y)
	var t_global_position = track_gt * relative_position
	var pos_tween = create_tween()
	pos_tween.tween_property(self, "position", t_global_position, 0.5)
