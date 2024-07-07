extends CharacterBody2D

@onready var woz_trigger: Area2D = $WozTrigger
@onready var taco: Player = $"../Taco"


func _on_woz_trigger_body_entered(body: Node2D) -> void:
	taco.input_enabled = false
	taco.animation_player.play("idle")
	Dialogic.start("woz_timeline")
	await Dialogic.timeline_ended
	taco.input_enabled = true
	woz_trigger.queue_free()
