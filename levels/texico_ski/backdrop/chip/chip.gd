extends Area2D


var speed = 1.5
var player
@onready var pathfollow : PathFollow2D = $Path2D/PathFollow2D
var tracking_speed = 250
var done_ramp = false
var first_time = true
signal start_trick_first_time
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(-speed,-speed)
	if player != null:
		pathfollow.progress += tracking_speed * delta
		player.position = pathfollow.global_position
		if pathfollow.progress_ratio > 0.95:
			player.start_trick_animation()
			player = null
			done_ramp = true
			if first_time == true:
				start_trick_first_time.emit()
				first_time = false
			
			


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("player") and body.on_ramp() == false and player == null and done_ramp == false:
		player = body
		player.rotateSprite(-0.3)
		player.to_ramp()
	pass # Replace with function body.
