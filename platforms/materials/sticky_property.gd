extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if body.is_in_group("Player"):
		ItemManager.get_player().set_speed(50)
		ItemManager.get_player().set_jump_velocity(-100)


func _on_body_exited(body):
	if body.is_in_group("Player"):
		ItemManager.get_player().set_speed(200)
		ItemManager.get_player().set_jump_velocity(-400)
