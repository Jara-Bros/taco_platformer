extends Node2D

@onready var anim_player: AnimationPlayer = $HiddenArea/AnimationPlayer
@onready var color_rect: ColorRect = $SoccerSwitch/ColorRect
@onready var taco: Player = $Taco

@onready var gym_door_anim_player: AnimationPlayer = $SoccerSwitch/AnimationPlayer


@onready var swing_anim_player: AnimationPlayer = $SwingObstacles/SwingObstacle/AnimationPlayer
@onready var swing_anim_player_2: AnimationPlayer = $SwingObstacles/SwingObstacle2/AnimationPlayer
@onready var swing_anim_player_3: AnimationPlayer = $SwingObstacles/SwingObstacle3/AnimationPlayer


func _ready() -> void:
	swing_anim_player_3.play("swing")
	swing_anim_player.play("swing")
	

	

func _process(_delta: float) -> void:
	pass


func _on_hidden_area_area_entered(_area: Area2D) -> void:
	anim_player.play("fade_out")


func _on_soccer_switch_area_entered(area: Area2D) -> void:
	color_rect.visible = false
	gym_door_anim_player.play("move_up")
	

# Signal for when the swing hits Taco
# Sets collision mask for walls to false
func _on_area_2d_body_entered(body: Node2D) -> void:
	taco.set_collision_mask_value(1, 0)


func _on_timer_timeout() -> void:
	# Delayed start for asynchronous swinging obstacles
	swing_anim_player_2.play("swing")
