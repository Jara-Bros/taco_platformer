extends Control

@onready var button_v_box: VBoxContainer = $MarginMainMenuContainer/ButtonVBox
@onready var anim_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var timer: Timer = $Timer


func _ready() -> void:
	pass


func _on_start_button_pressed() -> void:
	anim_player.play("fade_in")
	await anim_player.animation_finished
	SceneManager.set_initial_scene("KitchenSequence")


func _on_quit_button_pressed() -> void:
	get_tree().quit()

func focus_button() -> void:
	if button_v_box:
		var button: Button = button_v_box.get_child(0)
		if button is Button:
			button.grab_focus()


func _on_timer_timeout() -> void:
	focus_button()
