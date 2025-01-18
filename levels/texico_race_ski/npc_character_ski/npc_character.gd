extends RigidBody2D


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
	pass


func _on_timer_timeout():
	apply_impulse(Vector2(0,-50))
	pass # Replace with function body.

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
