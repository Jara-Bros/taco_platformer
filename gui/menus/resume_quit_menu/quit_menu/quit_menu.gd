extends Control

func _ready():
	visible = false

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true


# Opens & closes pause menu
func test_escape_key():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()
		visible = true
	elif Input.is_action_just_pressed("pause") and get_tree().paused == true:
		resume()
		
	

func _on_resume_button_pressed() -> void:
	visible = false
	resume()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
func _process(_delta: float) -> void:
	test_escape_key()

func _on_save_button_pressed() -> void:
	SaveManager.on_save_game()
	visible = false
	resume()


func _on_load_button_pressed() -> void:
	SaveManager.on_load_game()
	visible = false
	resume()
