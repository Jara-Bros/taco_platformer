extends Area2D


var player_on : Player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


 


func _on_area_entered(area):
	if area.is_in_group("bowl"):
		area.on_conveyer = true



func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_on = body
		ItemManager.on_conveyor = true


func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_on = null
		ItemManager.on_conveyor = false
