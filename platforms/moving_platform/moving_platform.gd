extends StaticBody2D

# Purpose:
#  a moving platform that just moves to the left 
#  when it enters the screen



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 100 * delta
	pass


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
