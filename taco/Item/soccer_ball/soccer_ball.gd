extends RigidBody2D

#var SoccerMechanics = preload("res://taco/Item/soccer_ball_mechanics.gd")

enum freedom_state {REMOVED, COLLECTED}
var current_state = freedom_state.REMOVED
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state == freedom_state.COLLECTED:
		follow_player()

func action(animation_player, impulse, type):
	current_state = freedom_state.REMOVED
	animation_player.play("kick")
	gravity_scale = 0
	apply_impulse(impulse)
	$GoneTime.start()
	

func _on_body_entered(body):
	if body.get_name() == "Taco":
		if current_state == freedom_state.REMOVED:
			ItemManager.connect_item_to_player(get_instance_id())
			await get_tree().create_timer(1).timeout
			current_state = freedom_state.COLLECTED
	pass # Replace with function body.

func follow_player():
	var move_distance = ItemManager.follow_with_item("soccer_ball", position)
	if move_distance != null:
		var combined_vector = move_distance - position
		apply_impulse(combined_vector)
		## then we can update it
		#position = move_distance


func _on_gone_time_timeout():
	gravity_scale = 1
	#current_state = freedom_state.COLLECTED
