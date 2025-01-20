extends CanvasLayer

@export var ticket_scene : PackedScene

@onready var kitchen_ticket_sfx: AudioStreamPlayer2D = $KitchenTicketSFX


var taco_lives = 0


func _ready():
	pass


func _process(delta):
	pass


func update_ticket(score: int):
	$Label.text = "Score: " + str(score)


func add_new_ticket():
	kitchen_ticket_sfx.play()
	var ticket = ticket_scene.instantiate()
	$ColorRect/HBoxContainer.add_child(ticket)
 

func decrease_taco_life():
	taco_lives += 1
	$TacoLives.text = "Dead Orders: " + str(taco_lives)
	if taco_lives == 3:
		game_over()


func game_over():
	get_tree().quit()
