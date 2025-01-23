extends CanvasLayer

var title: String = "TACO"

# Called when the node enters the scene tree for the first time.
func _ready():
	if title.to_lower() != "taco":
		$Label.text = "C'mon Man"
	else:
		$Label.text = "\n CONGRATS " + title
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	queue_free()
	pass # Replace with function body.
