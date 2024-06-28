extends CharacterBody2D

#var SoccerMechanics = preload("res://taco/Item/soccer_ball_mechanics.gd")

enum freedom_state {REMOVED, COLLECTED, KICKED}
var current_state = freedom_state.REMOVED
var moving_direction
@export var translation_speed : int
var MAX_DISTANCE  = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state == freedom_state.COLLECTED:
	#	var player_direction = ItemManager.get_player().get_direction()
	#	if player_direction > 0:
		#if abs(global_position.distance_to(ItemManager.get_player().global_position)) > 20:
			
		var new_player_position =ItemManager.get_player().global_position
		var distanceToPlayer = global_position.direction_to(new_player_position)
		var player_state = ItemManager.get_player().get_state()
		var collide = move_and_collide(distanceToPlayer * translation_speed)
		#handle_state_movement(player_state, distanceToPlayer)
	#	else:
	#		var new_player_position =ItemManager.get_player().global_position + Vector2(-20,5)
	#		var distanceToPlayer = global_position.direction_to(new_player_position)
	#		var player_state = ItemManager.get_player().get_state()
	#		handle_state_movement(player_state, distanceToPlayer)
	elif current_state == freedom_state.KICKED:
		#print(moving_direction)
		if moving_direction > 0:
			velocity.x = 500
			move_and_slide()
		else:
			velocity.x = -500
			move_and_slide()
	#var direction_to_player = global_position.direction_to(ItemManager.get_player().global_position)
	#$RayCast2D.target_position = ItemManager.get_player().global_position
	#await get_tree().create_timer(0.2 * delta).timeout
	#$RayCast2D.force_raycast_update()
	#var collision_object = $RayCast2D.get_collider()
	#if collision_object == ItemManager.get_player():
		#pass
	#follow_player(direction_to_player, ItemManager.get_player().global_position)
	
	

#func _on_body_entered(body):
	#print_debug("made it")
	##if body.get_name() == "Taco":
		##if current_state == freedom_state.REMOVED:
			##ItemManager.connect_item_to_player(get_instance_id())
			##await get_tree().create_timer(1).timeout
			##current_state = freedom_state.COLLECTED
			
#func _integrate_forces(state):
	#if current_state == freedom_state.COLLECTED:
		#if  global_position.distance_to(ItemManager.get_player().global_position) > 20:
			#var direction_to_player = global_position.direction_to(ItemManager.get_player().global_position)
			#apply_central_impulse(direction_to_player * 15)
	#
#
#func follow_player(direction, player_position):
	#if  current_state == freedom_state.COLLECTED:
		#gravity_scale = 0
		#global_position = $RayCast2D.target_position
		##apply_impulse(direction)
	
	#if player_direction > 0:
			## player facing right
		#var new_location = player_vector 
		#
	#else:
		#var new_location = player_vector
		#translate(new_location * 3 )

func handle_state_movement(state, direction):
	match state:
		0:
			var player_direction = ItemManager.get_player().get_direction()
			move_and_collide(direction * translation_speed )
		1:
			move_and_collide(direction  * translation_speed)
			pass
		2:
			
			# MOVE RIGHT
			var new_direction = direction 
			move_and_collide(new_direction * translation_speed)
			pass
		
		3:
			# IN AIR
			pass

func kick():
	current_state = freedom_state.KICKED
	$CollisionShape2D.call_deferred("set_disabled", true)
	#$CollisionShape2D.call_deferred("set_disabled", false)
	moving_direction = ItemManager.get_player().get_direction()
	#move_and_collide(direction)

			


func _on_area_2d_body_entered(body):
	print(body.get_name())
	if body.get_name() == "Taco":
		$CollisionShape2D.call_deferred("set_disabled", false)
		if current_state == freedom_state.REMOVED or current_state == freedom_state.KICKED:
			ItemManager.connect_item_to_player(get_instance_id())
			current_state = freedom_state.COLLECTED
	elif body.get_name() == "wall":
		if current_state == freedom_state.KICKED:
			print("made tif")
			moving_direction = 0
	 
	
