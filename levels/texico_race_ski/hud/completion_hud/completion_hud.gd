extends CanvasLayer

var title: String = "TACO"
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = false
	if title.to_lower() != "taco":
		$Label.text = "C'mon Man"
	else:
		$Label.text = "\n CONGRATS " + title
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$Label.visible = false
	color_rect.visible = true
	anim_player.play("fade_out")
	await anim_player.animation_finished
	SceneManager.switch_scene("Beach", {})
