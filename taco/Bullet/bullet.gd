class_name Bullet
extends Area2D


const current_scene: PackedScene = preload("res://taco/Bullet/bullet.tscn")

@export var bullet_speed : int
var angle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(bullet_speed, angle))
	pass

static func new_bullet(setting_angle):
	var new_bullet = current_scene.instantiate()
	new_bullet.angle = setting_angle
	return new_bullet

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
