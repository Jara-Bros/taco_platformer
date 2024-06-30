extends Node2D

var egg_transform_character = preload("res://levels/testing/transformations/egg/egg_transform_character.tscn").instantiate()
var egg_transform_character_2 = preload("res://levels/testing/transformations/egg/egg_transform_character_2.tscn").instantiate()
var bowling_transform_character = preload("res://levels/testing/transformations/bowling_ball/bowling_ball_transform.tscn").instantiate()
var new_taco = preload("res://taco/taco.tscn").instantiate()


@onready var canon_box: Area2D = $CanonBox
@onready var canon_box_2: Area2D = $CanonBox2
@onready var bowling_box: Area2D = $BowlingBox
@onready var character_box_taco: Area2D = $CharacterBoxTaco
@onready var character_box_taco_2: Area2D = $CharacterBoxTaco2
@onready var redacted: TextureRect = $Redacted

@onready var barb_talk_trigger: Area2D = $BarbTalkTrigger
@onready var bleu_talk_trigger: Area2D = $BleuTalkTrigger
@onready var leftover_talk_trigger: Area2D = $LeftoverTalkTrigger
@onready var quit: CanvasLayer = $Quit


@onready var taco: Player = $Taco

@onready var leftover_test: CharacterBody2D = $LeftoverTest


func _ready():
	taco.get_child(3).set_limit(SIDE_LEFT, -350)
	taco.get_child(3).set_limit(SIDE_TOP, -700)

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_cancel"):
		quit.visible = true


var player_spawn_location_dict = {
	egg_spawn = Vector2(1312, 25),
	egg_spawn_2 = Vector2(1200, 375),
	egg_transformation_return = Vector2(1077, -379),
	bowling_spawn = Vector2(4100, -580),
	bowling_transformation_return = Vector2(2843, -860)
}


func get_spawn_location(_spawn : String):
	return player_spawn_location_dict[_spawn]


# Handles canon box trigger
func _on_canon_box_body_entered(_body: Node2D) -> void:
	egg_transform_character.position = get_spawn_location("egg_spawn")
	remove_child(taco)
	call_deferred("add_child", egg_transform_character)
	canon_box.queue_free()

func _on_canon_box_2_body_entered(_body: Node2D) -> void:
	egg_transform_character_2.position = get_spawn_location("egg_spawn_2")
	remove_child(taco)
	call_deferred("add_child", egg_transform_character_2)
	canon_box_2.queue_free()


# Handles bumpers
func _on_bumper_left_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.y = 0
	egg_transform_character.velocity.x = -1 * 800


func _on_bumper_up_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.x = 0
	egg_transform_character.velocity.y = -1 * 800
	egg_transform_character_2.velocity.x = 0
	egg_transform_character_2.velocity.y = -1 * 800


func _on_bumper_right_body_entered(_body: Node2D) -> void:
	egg_transform_character.velocity.y = 0
	egg_transform_character.velocity.x = 800
	egg_transform_character_2.velocity.y = 0
	egg_transform_character_2.velocity.x = 800


# Handles bowling box trigger
func _on_bowling_box_body_entered(_body: Node2D) -> void:
	bowling_transform_character.position = get_spawn_location("bowling_spawn")
	remove_child(taco)
	call_deferred("add_child", bowling_transform_character)
	bowling_box.queue_free()


# Handles transformation back to taco
func _on_character_box_taco_body_entered(_body: Node2D) -> void:
	taco.position = get_spawn_location("egg_transformation_return")
	egg_transform_character.queue_free()
	egg_transform_character_2.queue_free()
	character_box_taco.queue_free()
	call_deferred("add_child", taco)


func _on_character_box_taco_2_body_entered(_body: Node2D) -> void:
	new_taco.position = get_spawn_location("bowling_transformation_return")
	bowling_transform_character.queue_free()
	character_box_taco_2.queue_free()
	call_deferred("add_child", new_taco)


func _on_bumper_up_2_body_entered(_body: Node2D) -> void:
	egg_transform_character_2.velocity.x = 0
	egg_transform_character_2.velocity.y = -1 * 800


func _on_bumper_left_2_body_entered(_body: Node2D) -> void:
	egg_transform_character_2.velocity.y = 0
	egg_transform_character_2.velocity.x = -1 * 800


func _on_barb_talk_trigger_body_entered(_body: Node2D) -> void:
	new_taco.input_enabled = false
	new_taco.animation_player.play("idle")
	Dialogic.start("barb_test_timeline")
	await Dialogic.timeline_ended
	new_taco.input_enabled = true
	barb_talk_trigger.queue_free()
	

func _on_bleu_talk_trigger_body_entered(_body: Node2D) -> void:
	new_taco.input_enabled = false
	new_taco.animation_player.play("idle")
	Dialogic.start("bleu_test_timeline")
	await Dialogic.timeline_ended
	new_taco.input_enabled = true
	bleu_talk_trigger.queue_free()

func _on_leftover_talk_trigger_body_entered(_body: Node2D) -> void:
	new_taco.input_enabled = false
	new_taco.animation_player.play("idle")
	Dialogic.start("leftover_test_timeline")
	await Dialogic.timeline_ended
	leftover_test.queue_free()
	redacted.visible = true
	new_taco.input_enabled = true
	leftover_talk_trigger.queue_free()


func _on_button_pressed() -> void:
	get_tree().quit()
