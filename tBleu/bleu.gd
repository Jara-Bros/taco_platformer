extends CharacterBody2D

signal path_complete(direction)

@export var jump_velocity = -300.0
@export var translation_speed : int
@export var tracking_speed: int
@export var rotation_speed : int
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var right_path: PathFollow2D = $RightParent/right_path
@onready var left_path: PathFollow2D = $LeftParent/left_path
@onready var right_path_parent: Path2D = $RightParent
@onready var left_path_parent: Path2D = $LeftParent
@onready var left_stick : PathFollow2D = $LeftStickParent/left_stick
@onready var right_stick : PathFollow2D =  $RightStickParent/right_stick
@onready var left_stick_parent : Path2D = $LeftStickParent
@onready var right_stick_parent : Path2D = $RightStickParent
enum bleu_state {FOLLOWING, PATH_TRACKING, FLYING, STUCK}
var current_state = bleu_state.FOLLOWING
var pathway_direction
var player_mapping_vectors = {
	-1: Vector2(-20, 2),
	1: Vector2(20,2)
}

var direction
var type_of_path
var stuck_count : int
var stuck_platform_instance_id

func _ready():
	ItemManager.connect_item_to_player(get_instance_id(), "bleu")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if current_state == bleu_state.FOLLOWING:
		if not is_on_floor_only():
			velocity.y += 1.5 * 980 * delta
		var player_direction = ItemManager.get_player().get_direction()
		#update_bleu_sped()
		var ideal_ball_position = ItemManager.get_player().global_position-player_mapping_vectors[player_direction]
		if abs(global_position.distance_to(ideal_ball_position)) > 7: 
			var distanceToPlayer = global_position.direction_to(ideal_ball_position)
			var player_state = ItemManager.get_player().get_state()
			var collide = move_and_collide(distanceToPlayer * delta * translation_speed)
		
		
		update_path_positions(position)
		#position = global_position
		#left_path_parent.position = global_position
		#print(left_path.position, right_path.position, position)
		# Flip sprite
		if player_direction > 0:
			sprite_2d.flip_h = false
		elif player_direction < 0:
			sprite_2d.flip_h = true

		# Play animations
		if is_on_floor():
			if player_direction == 0:
				animation_player.play("idle")
			else:
				animation_player.play("walk")
		else:
			if velocity.y < 0:
				animation_player.play("jump")
			if velocity.y > 0:
				animation_player.play("idle")
	elif current_state == bleu_state.PATH_TRACKING:
		var current_path_node
		if type_of_path == "throw":
			if ItemManager.get_player().get_direction() > 0:
				current_path_node = right_path
			else:
				current_path_node = left_path
		elif type_of_path == "stick":
			if ItemManager.get_player().get_direction() > 0:
				current_path_node = right_stick
			else:
				current_path_node = left_stick
			ItemManager.get_player().input_enabled = false
			
	
		current_path_node.progress += tracking_speed * delta
		position = current_path_node.position
		rotation += ItemManager.get_player().get_direction() * rotation_speed * delta
		if current_path_node.progress_ratio > 0.95:
		
			if current_path_node == left_path:
				path_complete.emit("left")
			else:
				path_complete.emit("right")
	elif current_state == bleu_state.FLYING:
		velocity.y = 0
		velocity.x = pathway_direction * tracking_speed
		rotation += pathway_direction * rotation_speed * delta
		move_and_slide()
	
		


	#move_and_slide()
	
	
func update_bleu_speed():
	var player_position = ItemManager.get_player().global_position
	var player_direction = ItemManager.get_player().get_direction()
	if player_direction > 0:
		## we are facing right
		if position.x > player_position.x + 10:
			translation_speed = 200
		else:
			translation_speed = 600
	else:
		## we are facing left
		if position.x < player_position.x - 10:
			translation_speed = 200
		else:
			translation_speed = 600
			
func throw():
	if current_state == bleu_state.FLYING or current_state == bleu_state.STUCK or current_state == bleu_state.PATH_TRACKING:
		reset_bleu()
	else:
		type_of_path = "throw"
		current_state = bleu_state.PATH_TRACKING
	
func stick():
	if current_state == bleu_state.STUCK:
		reset_bleu()
	else:
		type_of_path = "stick"
		current_state = bleu_state.PATH_TRACKING

func update_path_positions(pos):
	left_path_parent.curve.set_point_position(0,global_position)
	left_path_parent.curve.set_point_position(1,global_position + Vector2(-16, 0))
	left_path_parent.curve.set_point_position(2,global_position + Vector2(-128, 0))
	right_path_parent.curve.set_point_position(0,global_position)
	right_path_parent.curve.set_point_position(1,global_position + Vector2(16, 0))
	right_path_parent.curve.set_point_position(2,global_position + Vector2(128, 0))
	
	left_stick_parent.curve.set_point_position(0,global_position)
	left_stick_parent.curve.set_point_position(1,global_position + Vector2(-32,-16))
	left_stick_parent.curve.set_point_position(2,global_position + Vector2(-48,-8))
	left_stick_parent.curve.set_point_position(3,global_position + Vector2(-48,4))
	
	right_stick_parent.curve.set_point_position(0,global_position)
	right_stick_parent.curve.set_point_position(1,global_position + Vector2(32,-16))
	right_stick_parent.curve.set_point_position(2,global_position + Vector2(48,-8))
	right_stick_parent.curve.set_point_position(3,global_position + Vector2(48,4))
	
func set_stuck_platform(inst):
	stuck_platform_instance_id = inst


func _on_path_complete(direc):
	if type_of_path == "throw":
		current_state = bleu_state.FLYING
		if direc == "left":
			pathway_direction = -1	
		else:
			pathway_direction = 1
	elif type_of_path == "stick":
		ItemManager.get_player().input_enabled = true
		current_state = bleu_state.STUCK
		set_collision_mask_value(2,true)
		ItemManager.get_player().set_collision_mask_value(5,true)


func _on_area_2d_body_entered(body):
	if body.get_name() == "wall":
		current_state = bleu_state.STUCK
		set_collision_mask_value(2,true)
		ItemManager.get_player().set_collision_mask_value(5,true)
	elif body.get_name() == "TomatoTomCharacter":
		for enemey in get_tree().get_nodes_in_group("Enemies"):
			if enemey.get_instance_id() == body.get_instance_id():
				enemey.queue_free()
	#elif body.get_name() == "Taco":
		#if current_state == bleu_state.STUCK:
			#stuck_count += 1
			#if stuck_count == 3:
				#current_state = bleu_state.FOLLOWING
				#set_collision_mask_value(2,false)
				#for board in get_tree().get_nodes_in_group("cracked_board"):
					#if board.get_instance_id() == stuck_platform_instance_id:
						#board.queue_free()
	elif body.get_name() == "CorpoCharacter":
		if current_state == bleu_state.FLYING:	
			current_state = bleu_state.FOLLOWING
			rotation = 0

func reset_bleu():
	set_collision_mask_value(2,false)
	ItemManager.get_player().set_collision_mask_value(5,false)
	rotation = 0
	current_state = bleu_state.FOLLOWING


func _on_visible_on_screen_enabler_2d_screen_exited():
	reset_bleu()
