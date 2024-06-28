extends Node2D

var egg_transform_character = preload("res://levels/testing/transformations/egg_transform_character.tscn").instantiate()
@onready var egg_transform_trigger: Area2D = $EggTransformTrigger


@onready var taco: Player = $Taco


var player_spawn_location_dict = {
	egg_spawn = Vector2(222, -64),
	transformation_return = Vector2(640, -16)

}


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


func _on_egg_transform_trigger_body_entered(_body: Node2D) -> void:
	egg_transform_character.position = get_spawn_location("egg_spawn")
	remove_child(taco)
	call_deferred("add_child", egg_transform_character)
	egg_transform_trigger.queue_free()
	


func _on_ricochet_trigger_up_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.y = -1 * 800

func _on_ricochet_trigger_left_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.y = 0
	egg_transform_character.velocity.x = -1 * 800
	
func _on_ricochet_trigger_right_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.y = 0
	egg_transform_character.velocity.x = 800


func _on_transform_return_trigger_body_entered(_body: Node2D) -> void:
	taco.position = get_spawn_location("transformation_return")
	egg_transform_character.queue_free()
	call_deferred("add_child", taco)
