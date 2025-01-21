extends CanvasLayer

@export var ticket_scene : PackedScene

@onready var kitchen_ticket_sfx: AudioStreamPlayer2D = $KitchenTicketSFX
@onready var timer: Timer = $Timer
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var transition_anim_player: AnimationPlayer = $ColorRect2/AnimationPlayer


var dead_orders = 0


func _ready():
	pass


func _process(delta):
	pass


func update_ticket(score: int):
	$Label.text = "Score: " + str(score)


func add_new_ticket():
	var ticket = ticket_scene.instantiate()
	$ColorRect/HBoxContainer.add_child(ticket)
 

func decrease_taco_life():
	dead_orders += 1
	$TacoLives.text = "Dead Orders: " + str(dead_orders)
	
	if dead_orders == 1:
		Dialogic.start("sous_salad_rush")
		timer.wait_time = 5
	
	if dead_orders == 2:
		Dialogic.start("sous_offscreen_1")
		
	if dead_orders == 3:
		Dialogic.start("sous_offscreen_2")
		transition_anim_player.play("fade_out")
		await transition_anim_player.animation_finished
		SceneManager.switch_scene("TacoHouse", {})
		


func decreased_wait_time():
	timer.wait_time = 5


func _on_timer_timeout() -> void:
	anim_player.play("add_ticket")
