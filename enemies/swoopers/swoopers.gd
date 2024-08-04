extends Path2D

signal path_complete

var flying_speed : int = 5

@onready var interaction_area: Area2D = $AnimatableBody2D/InteractionArea
@onready var path_follow : PathFollow2D = $PathFollow2D
@onready var movement_timer : Timer = $Timer
@onready var sprite_2d :Sprite2D = $AnimatableBody2D/Sprite2D


enum direciton_facing {LEFT, RIGHT}
var current_direction
func _ready():
	current_direction = direciton_facing.RIGHT
	interaction_area.interact = Callable(self, "_on_interact")
	

func _physics_process(delta):

	path_follow.progress += flying_speed 
	#if path_follow.progress_ratio > 0.05:
		#path_complete.emit()
	#move_and_slide()

func move_path():
	if current_direction == direciton_facing.RIGHT:
		curve.set_point_position(0, global_position + Vector2(1,3))
		curve.set_point_position(1, global_position + Vector2(5,12))
		curve.set_point_position(2, global_position + Vector2(17,24))
		curve.set_point_position(3, global_position + Vector2(30,28))
		curve.set_point_position(4, global_position + Vector2(48,29))
	else:
		curve.set_point_position(0, global_position + Vector2(1,3))
		curve.set_point_position(1, global_position + Vector2(-5,12))
		curve.set_point_position(2, global_position + Vector2(-17,24))
		curve.set_point_position(3, global_position + Vector2(-30,28))
		curve.set_point_position(4, global_position + Vector2(-48,29))
func flip():
	if current_direction == direciton_facing.LEFT:
		current_direction = direciton_facing.RIGHT
		sprite_2d.flip_h = true
	else:
		current_direction = direciton_facing.LEFT
		sprite_2d.flip_h = false

func _on_interact():
	queue_free()


#func _on_timer_timeout():
	#var wait_time = randi_range(3,6)
	#movement_timer.wait_time = wait_time
	#flip()


func _on_path_complete():
	flip()
	move_path()
	path_follow.progress = 0
