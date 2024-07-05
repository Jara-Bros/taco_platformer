extends Node2D

@onready var taco: Player = $Taco

var player_spawn_location_dict = {
	woz_front_door = Vector2(-90, 99),
	barb_front_door = Vector2(215, 12)
}


func _ready():
	pass


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]
