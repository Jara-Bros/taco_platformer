extends CanvasLayer


var statuses = ["GOOD", "BAD"]

@export var current_status: String


func _ready():
	$Timer.start()
	$Label.add_theme_font_size_override("font_size", 30)
		
	pass # Replace with function body.

func set_type(type):
	current_status = type
	if current_status == "GOOD":
		$Label.text = "Nice!"
		$Label.add_theme_color_override("font_color", Color.SEA_GREEN)
		
	else:
		$Label.text = "Aw man..."
		$Label.add_theme_color_override("font_color", Color.RED)



func _process(delta):
	pass


func _on_timer_timeout():
	queue_free()
