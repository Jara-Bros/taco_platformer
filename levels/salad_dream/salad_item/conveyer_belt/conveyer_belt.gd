extends Area2D


var player_on : Player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_on != null:
		player_on.position.x += 50 * delta


func _on_area_entered(area):
	if area.is_in_group("bowl"):
		area.on_conveyer = true



func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_on = body
	pass # Replace with function body.


func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_on = null
