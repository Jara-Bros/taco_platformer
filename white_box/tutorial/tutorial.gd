extends Node2D

@onready var anim_player: AnimationPlayer = $HiddenArea/AnimationPlayer


func _ready() -> void:
	pass # Replace with function body.



func _process(_delta: float) -> void:
	pass


func _on_hidden_area_area_entered(_area: Area2D) -> void:
	anim_player.play("fade_out")
