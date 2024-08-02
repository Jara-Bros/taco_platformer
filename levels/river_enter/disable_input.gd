extends Area2D

@onready var taco: Player = $"../../../Taco"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


var jump_input_events

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Taco":
		disable_jump()
		animation_player.play("move")


func disable_jump():
	jump_input_events = InputMap.action_get_events("jump")
	InputMap.action_erase_events("jump")
