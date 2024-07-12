extends Area2D

var egg_count : int = 0
@onready var approval_sound: AudioStreamPlayer2D = $"../ApprovalSound"
@onready var big_wing_flap: AudioStreamPlayer2D = $"../BigWingFlap"
@onready var butterfly_ride_2: Path2D = $"../ButterflyRide2"
@onready var animation_player: AnimationPlayer = $"../ButterflyRide2/AnimationPlayer"
@onready var taco: Player = $"../Taco"


func _on_body_entered(_body: Node2D) -> void:
	egg_count += 1
	print_debug(egg_count)
	
	if egg_count >= 2:
		approval_sound.play()
		await approval_sound.finished
		big_wing_flap.play()
		animation_player.play("lower")
		await animation_player.animation_finished
		taco.input_enabled = false
		Dialogic.start("butterfly_ride_timeline")
		await Dialogic.timeline_ended
		taco.input_enabled = true
