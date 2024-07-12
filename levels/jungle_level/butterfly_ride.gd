extends AnimatableBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var animation_player: AnimationPlayer = $"../../CanvasLayer/AnimationPlayer"
@onready var taco: Player = $"../../Taco"
@onready var music_transition: AudioStreamPlayer2D = $"../../MusicTransition"


func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	var river = load("res://levels/river/river.tscn").instantiate()
	music_transition.play()
	taco.input_enabled = false
	animation_player.play("fade_in")
	await animation_player.animation_finished
	await music_transition.finished
	SceneManager.change_scenes(river)
