extends CharacterBody2D

#var SoccerMechanics = preload("res://taco/Item/soccer_ball_mechanics.gd")

enum freedom_state {REMOVED, COLLECTED, KICKED}
var current_state = freedom_state.REMOVED
enum vertical_state_machine {GROUND, AIR}
var current_vertical_state = vertical_state_machine.GROUND
var moving_direction
@export var translation_speed : int
@export var rotation_speed : int
@export var idle_jump_velocity : int
var MAX_DISTANCE  = 1000
var player_mapping_vectors = {
	-1: Vector2(20,-5),
	1: Vector2(-20,-5)
}
func _ready():
	pass # Replace with function body.


func _process(delta):
	if current_state == freedom_state.COLLECTED:

		var player_direction = ItemManager.get_player().get_direction()
		update_ball_speed()	
		rotate_ball(delta)
		var ideal_ball_position = ItemManager.get_player().global_position-player_mapping_vectors[player_direction]
		if abs(global_position.distance_to(ideal_ball_position)) > 7:
			var distanceToPlayer = global_position.direction_to(ideal_ball_position)
			var player_state = ItemManager.get_player().get_state()
			var collide = move_and_collide(distanceToPlayer * delta * translation_speed)
	
	elif current_state == freedom_state.KICKED:
		velocity.y = 0
		if moving_direction > 0:
			velocity.x = 500
			move_and_slide()
		else:
			velocity.x = -500
			move_and_slide()
			
	elif current_state == freedom_state.REMOVED:
		if not is_currently_on_flor():
			velocity +=  (get_gravity()/30) * delta
#
		## Handles and randomizes jump.
		if is_currently_on_flor():
			velocity.y = idle_jump_velocity 
		move_and_slide()	


func is_currently_on_flor():
	if $RayCast2D.get_collider() != null:
		if $RayCast2D.get_collider().get_name() == "floor":
			return true
	return false


func kick():
	current_state = freedom_state.KICKED
	moving_direction = ItemManager.get_player().get_direction()

func update_ball_speed():
	var player_position = ItemManager.get_player().global_position
	var player_direction = ItemManager.get_player().get_direction()
	if player_direction > 0:
		## we are facing right
		if position.x > player_position.x + 10:
			translation_speed = 200
		else:
			translation_speed = 500
	else:
		## we are facing left
		if position.x < player_position.x - 10:
			translation_speed = 200
		else:
			translation_speed = 500
			
func rotate_ball(delta):
	var player_velocity = ItemManager.get_player().velocity
	if player_velocity.x != 0:
		if player_velocity.x < 0:
		# rotate left
			rotation_degrees += -1 * rotation_speed * delta
		else:
		# rotate right
			rotation_degrees += 1 * rotation_speed * delta


func _on_area_2d_body_entered(body):
	print(body.get_name())
	if body.get_name() == "Taco":
		if current_state == freedom_state.REMOVED or current_state == freedom_state.KICKED:
			ItemManager.connect_item_to_player(get_instance_id(), "soccer_ball")
			current_state = freedom_state.COLLECTED
	elif body.get_name() == "wall":
		if current_state == freedom_state.KICKED:
			moving_direction = 0
	elif body.get_name() == "TomatoTomCharacter":
		for enemey in get_tree().get_nodes_in_group("Enemies"):
			if enemey.get_instance_id() == body.get_instance_id():
				enemey.queue_free()
				queue_free()
	


func _on_visible_on_screen_enabler_2d_screen_exited():
	current_state = freedom_state.REMOVED
	velocity=Vector2(0,0)
