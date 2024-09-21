extends Node2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var clock: Sprite2D = $BG/Clock
@onready var prep_sign: Sprite2D = $BG/PrepSign
@onready var restaurant_wall: TextureRect = $BG/RestaurantWall
@onready var host_wall: TextureRect = $Front/HostWall
@onready var host_stand: Sprite2D = $Front/HostWall/HostStand
@onready var coli: Sprite2D = $Coli
@onready var mob_far: Sprite2D = $MobFar


func _ready() -> void:
	Dialogic.start_timeline("ezzy_host_timeline")
	Dialogic.signal_event.connect(_on_dialogic_signal)
	await Dialogic.timeline_ended
	
	
	start_timer()
	

func start_timer():
	await get_tree().create_timer(3.0).timeout
	Dialogic.start_timeline("opening_talk")
	anim_player.play("empanada_walk")
	await Dialogic.timeline_ended



func _on_dialogic_signal(argument:String):
	if argument == "switch_on_signs":
		clock.frame = 1
		prep_sign.frame = 1
	elif argument == "change_to_oh":
		coli.frame = 1
	elif argument == "change_to_talk":
		coli.frame = 2
	elif argument == "change_to_oh":
		coli.frame = 1
	elif argument == "mob_far":
		mob_far.visible = true
		anim_player.play("mob_far")
		
