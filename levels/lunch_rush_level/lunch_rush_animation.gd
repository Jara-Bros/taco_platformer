extends Node2D

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var clock: Sprite2D = $BG/Clock
@onready var prep_sign: Sprite2D = $BG/PrepSign
@onready var restaurant_wall: TextureRect = $BG/RestaurantWall
@onready var host_wall: TextureRect = $Front/HostWall
@onready var host_stand: Sprite2D = $Front/HostStand



func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
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

	if argument == "switch_to_front":
		clock.visible = false
		prep_sign.visible = false
		restaurant_wall.visible = false
		host_wall.visible = true
		host_stand.visible = true
		Dialogic.start_timeline("ezzy_host_timeline")
		await Dialogic.timeline_ended
