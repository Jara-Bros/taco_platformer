extends Control

@onready var button_v_box: VBoxContainer = $MarginContainer/ButtonVBox

func _ready() -> void:
	focus_button()


func _on_start_button_pressed() -> void:
	SceneManager.set_initial_scene("DiosMio")


func _on_quit_button_pressed() -> void:
	get_tree().quit()

func focus_button() -> void:
	if button_v_box:
		var button: Button = button_v_box.get_child(0)
		if button is Button:
			button.grab_focus()
