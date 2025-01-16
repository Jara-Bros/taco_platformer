extends Node2D

@onready var woz: Sprite2D = $Woz


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)


func _on_dialogic_signal(argument:String):
	if argument == "change_frame":
		woz.frame = 1


func play_woz_dialogue():
	Dialogic.start("intro_beach")
	await Dialogic.timeline_ended
