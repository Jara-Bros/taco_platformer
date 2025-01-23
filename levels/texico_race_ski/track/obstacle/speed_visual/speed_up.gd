extends CanvasLayer

@onready var animation_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("speed")
	pass # Replace with function body.

func _on_animation_player_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
