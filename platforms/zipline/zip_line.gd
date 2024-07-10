extends Area2D


signal rail_complete
@export var rail_speed : int

@onready var rail : PathFollow2D = $Path2D/PathFollow2D

var is_riding = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if rail.progress_ratio >= 0.99:
		rail_complete.emit()
	if is_riding:
		rail.progress += rail_speed * delta
		ItemManager.get_player().position = rail.global_position

func _on_body_entered(body):
	if body.get_name() == "Taco" and is_riding == false:
		var player_position = ItemManager.get_player().global_position
		var distance_from_middle = position.x - player_position.x
		#print(position.x/500)
		rail.progress_ratio = (250 - distance_from_middle)/500
		is_riding = true


func _on_body_exited(body):
	if body.get_name() == "Taco":
		pass
		#is_riding = false


func _on_rail_complete():
	is_riding = false
