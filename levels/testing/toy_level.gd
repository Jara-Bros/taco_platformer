extends Node2D

@onready var taco: Player = $Taco
@onready var phantom_cam: PhantomCamera2D = $PhantomCam
@onready var phantom_cam_2: PhantomCamera2D = $PhantomCam2


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if taco.direction > 0:
		phantom_cam.priority = 1
	if taco.direction < 0:
		phantom_cam_2.priority = 1
