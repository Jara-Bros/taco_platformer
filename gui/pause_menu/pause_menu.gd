extends Control

func _ready():
	visible = false

func show_pause():
	if Input.is_action_pressed("pause"):
		visible = true
	elif Input.is_action_pressed("pause") && visible == true:
		visible = false
	pass
