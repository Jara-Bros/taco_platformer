extends Node2D

@export var spawn_scene: PackedScene
@export var frequency : float
@export var autostart : bool
@export_enum("left", "right") var direction : int
@onready var spawn_timer: Timer = $SpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer.wait_time = frequency
	spawn_timer.autostart = autostart
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var spawn_instance = spawn_scene.instantiate()
	spawn_instance.set_direction(direction)
	add_child(spawn_instance)
	
func start_timer():
	spawn_timer.start()
	
