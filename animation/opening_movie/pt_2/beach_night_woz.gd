extends Node2D


@onready var woz: Sprite2D = $Woz
@onready var anim_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)


func _on_dialogic_signal(argument:String):
	if argument == "change_frame_one":
		woz.frame = 1
	if argument == "change_frame_two":
		woz.frame = 2
	if argument == "play_corpo_box":
		anim_player.play("corpo_box")
	
	
func play_woz_dialogue():
	Dialogic.start("intro_beach")
	await Dialogic.timeline_ended
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
