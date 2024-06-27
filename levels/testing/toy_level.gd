extends Node2D

@onready var taco: Player = $Taco
@onready var phantom_cam_right: PhantomCamera2D = $PhantomCamRight
@onready var phantom_cam_left: PhantomCamera2D = $PhantomCamLeft


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if taco.direction > 0:
		phantom_cam_right.priority = 1
	if taco.direction < 0:
		phantom_cam_left.priority = 1
