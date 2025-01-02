extends Area2D


var speed = 1.5
var player
@onready var pathfollow : PathFollow2D = $Path2D/PathFollow2D
var tracking_speed = 40
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(-speed,-speed)
	if player != null:
		pathfollow.progress += tracking_speed * delta
		player.position = pathfollow.position
		if pathfollow.progress_ratio > 0.95:
			player.to_air()
			player = null


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body
	pass # Replace with function body.
