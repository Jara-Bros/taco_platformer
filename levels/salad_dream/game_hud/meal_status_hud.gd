extends CanvasLayer

var statuses = ["GOOD", "BAD"]
@export var current_status: String
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$Label.add_theme_font_size_override("font_size", 20)
		
	pass # Replace with function body.

func set_type(type):
	current_status = type
	if current_status == "GOOD":
		$Label.text = "GOOD"
		$Label.add_theme_font_override()
		$Label.add_theme_color_override("font_color", Color.SEA_GREEN)
		
	else:
		$Label.text = "BAD"
		$Label.add_theme_color_override("font_color", Color.RED)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	queue_free()
