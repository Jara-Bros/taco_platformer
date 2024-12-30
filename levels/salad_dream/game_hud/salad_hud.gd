extends CanvasLayer

@export var ticket_scene : PackedScene
var taco_lives = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_ticket(score: int):
	$Label.text = "Score: " + str(score)


func add_new_ticket():
	var ticket = ticket_scene.instantiate()
	$ColorRect/HBoxContainer.add_child(ticket)
 
func decrease_taco_life():
	taco_lives -= 1
	$TacoLives.text = "Lives: " + str(taco_lives)
	if taco_lives == 0:
		game_over()
func _on_ticket_timer_timeout():
	## generate a new ticket
	add_new_ticket()
	pass # Replace with function body.

func game_over():
	get_tree().quit()
