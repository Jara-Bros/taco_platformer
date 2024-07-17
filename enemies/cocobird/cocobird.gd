extends CharacterBody2D

@export var speed : int = 150.0
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	sprite_2d.flip_h = true

func _physics_process(delta: float) -> void:

	var direction_horizontal = speed
	if direction_horizontal:
		velocity.x = direction_horizontal


	move_and_slide()
	
	if velocity.x > 0:
		sprite_2d.flip_h = true
	elif velocity.x == 0:
		pass
	else:
		sprite_2d.flip_h = false


# To remove cocobird when it leaves the player screen
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
