extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("splash_page_transition")
	await animation_player.animation_finished
	queue_free()
