extends Node2D

@onready var taco: Player = $Taco
@onready var limona: CharacterBody2D = $Limona


var barb_gallery_one = preload("res://levels/texico_town/barb_house/barb_gallery_one.tscn").instantiate()

func _ready():
	taco.get_child(3).set_limit(SIDE_TOP, 0)
	taco.get_child(3).set_limit(SIDE_LEFT, 0)
	taco.get_child(3).set_limit(SIDE_BOTTOM, 600)
	limona.get_child(1).play("idle")

var player_spawn_location_dict = {
	taco_house_bottom = Vector2(64, 12),
	barb_front_door = Vector2(435, 162)
}

func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_taco_house_bottom_body_entered(_body: Node2D) -> void:
	var texico_town = load("res://levels/texico_town/texico_town.tscn").instantiate()
	texico_town.get_child(0).position = texico_town.get_spawn_location("taco_house_top")
	SceneManager.swap_scenes(texico_town)
	queue_free()


func _on_gallery_room_one_body_entered(_body: Node2D) -> void:
	barb_gallery_one.get_child(0).position = barb_gallery_one.get_spawn_location("exit_door")
	SceneManager.swap_scenes(barb_gallery_one)
	queue_free()


func _on_limona_talk_trigger_body_entered(body: Node2D) -> void:
	taco.input_enabled = false
	taco.animation_player.play("idle")
	Dialogic.start("limona_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
