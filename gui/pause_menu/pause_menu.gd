extends CanvasLayer

@onready var save_button: Button = $VBoxContainer/SaveButton
@onready var load_button: Button = $VBoxContainer/LoadButton


var is_paused : bool = false

func _ready() -> void:
	hide_pause_menu()
	

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused == false:
			show_pause_menu()
		else:
			hide_pause_menu()
		get_viewport().set_input_as_handled()
			

func show_pause_menu() -> void:
	get_tree().paused = true
	visible = true
	is_paused = true
	save_button.grab_focus()


func hide_pause_menu() -> void:
	get_tree().paused = false
	visible = false
	is_paused = false


func _on_save_button_pressed() -> void:
	SaveManager.on_save_game()
	await SaveManager.on_save_game()
	hide_pause_menu()


func _on_load_button_pressed() -> void:
	SaveManager.on_load_game()
	await SaveManager.on_load_game()
	hide_pause_menu()
