extends CharacterBody2D

@onready var barb_talk: Area2D = $BarbTalk
@onready var taco: Player = $"../Taco"
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _on_barb_talk_body_entered(body: Node2D) -> void:
	taco.input_enabled = false
	taco.animation_player.play("idle")
	animation_player.play("idle")
	Dialogic.start("barb_timeline")
	await Dialogic.timeline_ended
	animation_player.play("idle_up")
	taco.input_enabled = true
	barb_talk.queue_free()
