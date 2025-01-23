extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_label_text(tex):
	if tex == "GO!":
		$Label.add_theme_color_override("font_color", Color("#FF4F00"))
	$Label.text = tex
