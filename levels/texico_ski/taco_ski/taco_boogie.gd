extends CharacterBody2D

var direction

var speed = 2.5
enum state {GROUND, AIR, ON_RAMP}
var current_state
var original_rotation

var trick_degree = 0.05
var tracking_speed = 40

## tricks syststem
var trick_points : float 
var first_click : float = -1
const MIN_ROTATION: float = 73.5
const MAX_ROTATION: float = 34.7
const PERFECT_ROTATION: float = 19.4
var landing_score_arr : Array = [62.68, 52.02, 41.28, 30.54, 19.4]
var landing_score_map : Dictionary = {
	-1: "BAD",
	0: "Ok",
	1: "Good",
	2: "Great",
	3: "Excellent",
	4: "PERFECT"
}
@export var landing_score_hud : PackedScene
@onready var animation_player = $AnimationPlayer
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = state.GROUND
	original_rotation = $Sprite2D.rotation
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if paused == false:
		direction = Input.get_axis("move_left", "move_right")
		if current_state == state.GROUND:
			if direction:
				position += direction * Vector2(speed*2,-speed)
		elif current_state == state.AIR:
			if Input.is_action_just_pressed("move_left") or  Input.is_action_just_pressed("move_right"):
				direction = Input.get_axis("move_left", "move_right")
				if first_click == -1:
					first_click = direction
					trick_points += 5
					$Label.text = str(trick_points) + " points!"
				else:
					## Awarded for doing flips in the same direction
					if direction == first_click:
						trick_points += 5
						$Label.text = str(trick_points) + " points!"
					pass
				
				$Sprite2D.rotation += direction * 0.25

			#if direction:
				#$Sprite2D.rotation += direction * trick_degree
				#trick_points += 0.5
			$ShadowShader.set_shadow_size(2.5 - ($Sprite2D.position.y * 0.05))
			
	move_and_slide()
	
func set_sprite_position(pos):
	$Sprite2D.position = pos
#func move_x_direction_tween():
	#var tween: Tween = create_tween()
	#tween.set_loops(1)
	#tween.tween_property(self, "position", position, 2)

func to_ramp():
	current_state = state.ON_RAMP
	$ShadowShader.visible = true
func on_ramp():
	return current_state == state.ON_RAMP
func to_air():
	current_state = state.AIR
func to_ground():
	current_state = state.GROUND
	
func start_trick_animation():
	to_air()
	$AnimationPlayer.play("in_air")
	$ShadowShader.visible = true
	#move_x_direction_tween()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "in_air":
		to_ground()
		return_to_original_rotation()
		$ShadowShader.visible = false
		$Label.text = ""
		var update_hud = get_tree().get_first_node_in_group("points_hud")
		update_hud.set_trick_points(trick_points)	
		trick_points = 0
		trigger_landing_score()
func return_to_original_rotation():
	var tween : Tween = create_tween()
	tween.tween_property($Sprite2D, "rotation", original_rotation, 0.5)
	tween.set_loops(1)
	


func trigger_landing_score():
	var current_rotation = $Sprite2D.rotation
	var output_string = binary_search(current_rotation)
	var landing_hud_instance = landing_score_hud.instantiate()
	landing_hud_instance.set_status(output_string)
	get_tree().current_scene.add_child(landing_hud_instance)	

func binary_search(current_rotation):
	# binary search arguments: array, low, high, and number we are looking for
	var low = 0
	var high = landing_score_map.size() - 1
	var current_rotation_degrees = abs(rad_to_deg(current_rotation))
	while (low <= high):
		var mid = low + (high - low) / 2
		print(str(current_rotation_degrees) + "    " +str(mid))
		## if perfectly land on one of these
		if landing_score_arr[mid] == current_rotation_degrees:
			print(mid)
			return landing_score_map[mid]
		## we found our range
		elif landing_score_arr[0] < current_rotation_degrees:
			## bad score
			print(mid)
			return landing_score_map[-1]
		elif landing_score_arr[4] > current_rotation_degrees:
			print(mid)
			return landing_score_map[4]
		elif (landing_score_arr[mid - 1] > current_rotation_degrees and landing_score_arr[mid] < current_rotation_degrees):
			var middle = (landing_score_arr[mid - 1] + landing_score_arr[mid]) / 2
			if current_rotation_degrees >= middle:
				print(mid)
				return landing_score_map[mid]
			else:
				print(mid)
				return landing_score_map[mid-1]
		
		elif landing_score_arr[mid] > current_rotation_degrees and landing_score_arr[mid + 1] < current_rotation_degrees:
			var middle = (landing_score_arr[mid] + landing_score_arr[mid + 1]) / 2
			if current_rotation_degrees >= middle:
				print(mid)
				return landing_score_map[mid + 1]
			else:
				print(mid)
				return landing_score_map[mid]		
			
		## if left 
		if landing_score_arr[mid] < current_rotation_degrees:
			low = mid + 1
		elif landing_score_arr[mid] > current_rotation_degrees:
			high = mid - 1
		
	pass
func rotateSprite(rad):
	$Sprite2D.rotation = rad

func pause():
	paused = true
	$AnimationPlayer.speed_scale = 0
func unpause():
	paused = false
	$AnimationPlayer.speed_scale = 1
