extends Node


@export var taco_camera : CharacterBody2D
@export var bleu_camera :  CharacterBody2D
@export_enum("TACO_STARTS", "BLEU_STARTS") var starting_camera
# Called when the node enters the scene tree for the first time.
func _ready():
	if starting_camera == "TACO_STARTS":
		swap_players(true,false)
		 
	elif starting_camera == "BLEU_STARTS":
		swap_players(false,true)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if taco_camera.camera_2d.enabled == true:
			swap_players(false, true)
		else:
			swap_players(true,false)
	
	
	pass

func swap_players(taco_input,blue_input):
	taco_camera.camera_2d.enabled = taco_input 
	bleu_camera.camera_2d.enabled = blue_input
	if taco_input == true:
		taco_camera.enable()
		bleu_camera.disable()
	else:
		taco_camera.disable()
		bleu_camera.enable()
