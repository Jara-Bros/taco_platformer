extends Node2D

@onready var anim_player: AnimationPlayer = $HiddenArea/AnimationPlayer
@onready var color_rect: ColorRect = $SoccerSwitch/ColorRect

@onready var block_platform: StaticBody2D = $SoccerSwitch/StaticBody2D
@onready var block_platform_2: StaticBody2D = $SoccerSwitch/StaticBody2D2
@onready var block_platform_3: StaticBody2D = $SoccerSwitch/StaticBody2D3



func _ready() -> void:
	pass # Replace with function body.



func _process(_delta: float) -> void:
	pass


func _on_hidden_area_area_entered(_area: Area2D) -> void:
	anim_player.play("fade_out")


func _on_soccer_switch_area_entered(area: Area2D) -> void:
	color_rect.visible = false
	
	# Activate block platforms!
	block_platform.visible = true
	block_platform.collision_layer = 1
	block_platform_2.visible = true
	block_platform_2.collision_layer = 1
	block_platform_3.visible = true
	block_platform_3.collision_layer = 1
	
