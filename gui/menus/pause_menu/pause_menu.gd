extends Control

var save_button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	print(get_child_count())
	save_button = $AspectRatioContainer/PanelContainer/CenterContainer/VBoxContainer/SaveButton


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("pause") && visible == false:
		visible = true
		show_pause_menu()
	elif Input.is_action_pressed("pause") && visible == true:
		hide_pause_menu()


func _on_save_button_pressed() -> void:
	SaveManager.save_game()


func _on_quit_button_pressed() -> void:
	get_tree().quit()

## TODO
## Figure out why save_button.grab_focus() returns null

func show_pause_menu():
	save_button.grab_focus()

func hide_pause_menu():
	visible = false
