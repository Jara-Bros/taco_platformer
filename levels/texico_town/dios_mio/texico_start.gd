extends Node2D

@onready var taco: Player = $Taco
@onready var camera_2d: Camera2D = $Taco/Camera2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var initialized_data : Dictionary = {}

var player_spawn_location_dict = {
	initial_spawn_location = Vector2(638,-31),
	woz_front_door = Vector2(0, 75),
	barb_front_door = Vector2(650, 100)
}

var current_spawn_location : Vector2


func _ready():
	initialized_data = SceneManager.get_transfer_data("DiosMio")
	if initialized_data.has("player_spawn_location") == false:
		$Taco.position = player_spawn_location_dict["initial_spawn_location"]
		$Taco.input_enabled = false
		animation_player.play("transition_in")
		await animation_player.animation_finished
		Dialogic.start("taco_start_timeline")
		await Dialogic.timeline_ended
		$Taco.input_enabled = true
	else:
		$Taco.position = initialized_data["player_spawn_location"]
		

	Dialogic.signal_event.connect(_on_dialogic_signal)


func _on_dialogic_signal(argument:String):
	if argument == "change_scene":
		SceneManager.switch_scene("TexicoRace", {})

	
func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]
	


func _on_gallery_barb_gallery_switch(data):
	SceneManager.switch_scene("BarbGallery", data)


func _on_shoji_door_enter_woz_house(data):
	SceneManager.switch_scene("WozHouse", data)


func _on_limona_boogie_board_swtich(data):
	SceneManager.switch_scene("BoogieBoard", data)
