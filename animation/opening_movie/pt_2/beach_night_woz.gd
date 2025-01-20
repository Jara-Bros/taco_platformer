extends Node2D


@onready var woz: Sprite2D = $Woz
@onready var anim_player: AnimationPlayer = $AnimationPlayer


var player_input : bool = false

var input_count : int = 0

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
	player_input = true


func play_optoworm_dialogue():
	Dialogic.start("opto_worm_intro")
	await Dialogic.timeline_ended
	# SceneManager switch


func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("move_left") && player_input == true:
		woz.frame = 1
		input_count += 1
		
	if Input.is_action_just_pressed("move_right") && player_input == true:
		woz.frame = 5
		input_count += 1
		
	if Input.is_action_just_pressed("move_up") && player_input == true:
		woz.frame = 3
		input_count += 1
		
	if Input.is_action_just_pressed("move_down") && player_input == true:
		woz.frame = 4
		input_count += 1
		
	if input_count == 8:
		anim_player.play("woz_jump")
		input_count += 1


func changed_scene():
	SceneManager.switch_scene(" ", {})
