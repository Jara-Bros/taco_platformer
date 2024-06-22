extends Node2D

@onready var taco: Player = $Taco
@onready var barb: CharacterBody2D = $Barb


var player_spawn_location_dict = {
	office_exit_door = Vector2(-13, -4)
}



func _ready() -> void:
	taco.get_child(3).set_limit(SIDE_BOTTOM, 16)
	taco.get_child(3).set_limit(SIDE_LEFT, -111)
	taco.get_child(3).set_limit(SIDE_RIGHT, 624)


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]




func _on_interactive_area_body_entered(_body: Node2D) -> void:
	taco.input_enabled = false
	taco.animation_player.play("idle")
	barb.get_child(1).play("idle")
	Dialogic.start("barb_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
	barb.get_child(1).play("idle_up")


func _on_gallery_two_body_entered(_body: Node2D) -> void:
	var barb_gallery_two = load("res://levels/texico_town/barb_house/barb_gallery_two.tscn").instantiate()
	barb_gallery_two.get_child(0).position = barb_gallery_two.get_spawn_location("office_door")
	SceneManager.swap_scenes(barb_gallery_two)
	queue_free()
