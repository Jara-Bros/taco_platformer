extends Node2D

@onready var taco: Player = $Taco
@onready var camera_2d: Camera2D = $Taco/Camera2D



# Player spawn location from woz house -> woz house interior
var player_spawn_location_dict = {
	exit_door = Vector2(0, 75)
}


# Set player camera limits
func _ready():
	camera_2d.zoom = Vector2(2, 2)
	taco.sprite_2d.flip_h = true


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


# Triggers woz dialogue
func _on_woz_talk_trigger_body_entered(_body: Node2D) -> void:
	taco.input_enabled = false
	taco.animation_player.play("idle")
	Dialogic.start("woz_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true


func _on_exit_door_leave_woz(data):
	SceneManager.switch_scene("DiosMio", data)
