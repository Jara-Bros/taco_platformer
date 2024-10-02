extends Control

# @onready var save_button: Button = $AspectRatioContainer/PanelContainer/CenterContainer/VBoxContainer/SaveButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false


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
	# save_button.grab_focus()
	pass
	
func hide_pause_menu():
	visible = false
