extends CharacterBody2D


enum state_machine {T}
var bleu_state

func _ready():
	pass
	#bleu_state = 

func _physics_process(delta):

	
	$RemoteTransform2D.set_update_position(true)
	
	#move_and_slide()
