extends StaticBody2D

const base_width = 39.964
var size : int
var speed : int = 2
var obstacle_array : Array[Obstacle]
var object_name: String
signal race_complete(track_name)
@export var can_move : bool = true
@onready var sprite2d = $Sprite2D
@export var nacho_boulder: PackedScene
@export var speed_boost: PackedScene
@export var flying_object: PackedScene
@export var marker: PackedScene
var track_speed_state: int
var track_id: int
# Called when the node enters the scene tree for the first time.
func _ready():	
	#$CollisionShape2D.shape.set_size($Sprite2D.get_rect().size)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if can_move:
		$Sprite2D.position.x -= speed
	pass

func set_size(si):
	
	$Sprite2D.set_scale(Vector2(base_width*si,$Sprite2D.scale.y))
	$Sprite2D/RemoteTransform2D.force_update_cache()
#	$CollisionShape2D.shape.set_size($Sprite2D.get_rect().size)

func set_speed(spe):
	speed = spe
func set_marker(obs: Dictionary):
	var mark = marker.instantiate()
	mark.obstacle = obs
	mark.position.x  = obs["location"] * base_width
	mark.position.y -=16
	mark.speed = speed
	mark.spawn_object = Callable(self, "set_obstacle")
	mark.add_to_group(object_name)
	add_child(mark)
func set_obstacle(obs: Dictionary, pos):
	var rect: Rect2 = $Sprite2D.get_rect()
	var obstacle_instance = null
	
	if obs["type"] == "nacho_boulder":
		obstacle_instance = nacho_boulder.instantiate()
	elif obs["type"] == "cheese_boost":
		obstacle_instance = speed_boost.instantiate()
	else:
		obstacle_instance = flying_object.instantiate()
	
	obstacle_instance.set_parameters(obs)
	obstacle_instance.position = pos
	obstacle_instance.speed = speed
	obstacle_instance.slow_down.connect(slow_down)
	obstacle_instance.type = obs["type"]
	obstacle_instance.is_sendable = obs["is_sendable"]
	obstacle_instance.track = self
	obstacle_instance.add_to_group(object_name)
	obstacle_instance.can_move = true
	add_child(obstacle_instance)
	return obstacle_instance
			
func set_can_move(state: bool):
	can_move = state
	#get_tree().call_group(object_name,"set_can_move", true)			 
func slow_down():
	set_speed(speed-2)
	get_tree().call_group(object_name, "set_speed", speed-2)
	$Timer.start()
	track_speed_state = -1
	
func speed_up():
	set_speed(speed+1)
	get_tree().call_group(object_name, "set_speed", speed+1)
	$Timer.start()
	track_speed_state = 1

func _on_timer_timeout():
	if track_speed_state == -1:
		set_speed(speed+2)
		get_tree().call_group(object_name, "set_speed", speed+2)
	else:
		set_speed(speed-1)
		get_tree().call_group(object_name, "set_speed", speed-1)
	track_speed_state = 0

func get_end_point_position():
	return $Area2D.position
	pass

func _on_area_2d_body_entered(body):
	race_complete.emit(object_name)
	pass # Replace with function body.
