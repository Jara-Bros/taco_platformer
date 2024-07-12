extends Area2D

@export var curve : CollisionShape2D
@onready var spawn_range_box : CollisionShape2D
var list_of_spawners = []

func _get_configuration_warnings():
	for child in get_children():
		if child is GenericSpawner:
			return []
	return ["Need at least one spawner"]

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is CollisionShape2D:
			spawn_range_box = child
	for child in get_children():
		if child is GenericSpawner:
			list_of_spawners.append(child)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_random_position_timer_timeout():
	var spawn_point = randi_range(spawn_range_box.global_position.x/1.5 , spawn_range_box.global_position.x * 1.5)
#	print(Vector2(spawn_point,list_of_spawners[0].global_position.y))
	list_of_spawners[0].spawn(Vector2(spawn_point,list_of_spawners[0].global_position.y))
