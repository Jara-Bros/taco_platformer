extends Control

@onready var button_v_box: VBoxContainer = $ColorRect/MarginMainMenuContainer/ButtonVBox
@onready var anim_player: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var timer: Timer = $Timer

@onready var main_face: Sprite2D = $MainFace
@onready var main_face_two: Sprite2D = $MainFaceTwo
@onready var main_face_three: Sprite2D = $MainFaceThree
@onready var main_face_four: Sprite2D = $MainFaceFour


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


func face_change() -> void:
	var new_frame = randi_range(0,7)
	main_face.frame = new_frame
	
	var new_frame_2 = randi_range(0,7)
	main_face_two.frame = new_frame_2

	var new_frame_3 = randi_range(0,7)
	main_face_three.frame = new_frame_3
	
	var new_frame_4 = randi_range(0,7)
	main_face_four.frame = new_frame_4
