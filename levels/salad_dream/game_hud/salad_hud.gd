extends CanvasLayer

@export var ticket_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_timer_text(int($Timer.time_left))
	pass

func update_ticket(score: int):
	$Label.text = "Score: " + str(score)

func update_timer_text(time):
	$timer_label.text = "Timer: " + str(time)

func add_new_ticket():
	var ticket = ticket_scene.instantiate()
	$ColorRect/HBoxContainer.add_child(ticket)


func _on_timer_timeout():
	get_tree().quit()
	pass # Replace with function body.


func _on_ticket_timer_timeout():
	## generate a new ticket
	add_new_ticket()
	pass # Replace with function body.
