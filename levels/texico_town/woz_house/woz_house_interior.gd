extends Node2D


@onready var taco: Player = $Taco

# Player spawn location from woz house -> woz house interior
var player_spawn_location_dict = {
	exit_door = Vector2(162, -4)
}

# Set player camera limits
func _ready():
	taco.sprite_2d.flip_h = true
	taco.get_child(3).set_limit(SIDE_BOTTOM, 48)
	taco.get_child(3).set_limit(SIDE_RIGHT, 240)
	taco.get_child(3).set_limit(SIDE_LEFT, -176)
	
	


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


# Triggers woz dialogue
func _on_woz_talk_trigger_body_entered(_body: Node2D) -> void:
	taco.input_enabled = false
	taco.animation_player.play("idle")
	Dialogic.start("woz_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
