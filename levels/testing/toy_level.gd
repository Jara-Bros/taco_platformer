extends Node2D

var egg_transform_character = preload("res://levels/testing/transformations/egg/egg_transform_character.tscn").instantiate()
var bowling_transform_character = preload("res://levels/testing/transformations/bowling_ball/bowling_ball_transform.tscn").instantiate()
var new_taco = preload("res://taco/taco.tscn").instantiate()

@onready var egg_box: Area2D = $EggBox
@onready var bowling_box: Area2D = $BowlingBox
@onready var character_box_taco: Area2D = $CharacterBoxTaco
@onready var character_box_taco_2: Area2D = $CharacterBoxTaco2


@onready var trap_door: TileMapLayer = $TrapDoor


@onready var taco: Player = $Taco


var player_spawn_location_dict = {
	egg_spawn = Vector2(1070, 30),
	egg_transformation_return = Vector2(1064, -310),
	bowling_spawn = Vector2(4100, -580),
	bowling_transformation_return = Vector2(2843, -850)
}


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]



func _ready():
	pass


func _on_egg_box_body_entered(_body: Node2D) -> void:
	egg_transform_character.position = get_spawn_location("egg_spawn")
	remove_child(taco)
	call_deferred("add_child", egg_transform_character)
	egg_box.queue_free()


func _on_bumper_left_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.y = 0
	egg_transform_character.velocity.x = -1 * 800


func _on_bumper_up_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.x = 0
	egg_transform_character.velocity.y = -1 * 800


func _on_bumper_right_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.y = 0
	egg_transform_character.velocity.x = 800


func _on_bowling_box_body_entered(_body: Node2D) -> void:
	bowling_transform_character.position = get_spawn_location("bowling_spawn")
	remove_child(taco)
	call_deferred("add_child", bowling_transform_character)
	bowling_box.queue_free()


func _on_trap_door_button_body_entered(_body: Node2D) -> void:
	trap_door.queue_free()


func _on_character_box_taco_body_entered(body: Node2D) -> void:
	taco.position = get_spawn_location("egg_transformation_return")
	egg_transform_character.queue_free()
	character_box_taco.queue_free()
	call_deferred("add_child", taco)


func _on_character_box_taco_2_body_entered(body: Node2D) -> void:
	new_taco.position = get_spawn_location("bowling_transformation_return")
	bowling_transform_character.queue_free()
	character_box_taco_2.queue_free()
	call_deferred("add_child", new_taco)
