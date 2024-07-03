extends Node2D




@onready var taco: Player = $Taco


var player_spawn_location_dict = {
	woz_front_door = Vector2(-90, 99),
	barb_front_door = Vector2(215, 12)
}


func _ready():
	taco.get_child(3).set_limit(SIDE_LEFT, -1215)
	taco.get_child(3).set_limit(SIDE_BOTTOM, 425)


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]
