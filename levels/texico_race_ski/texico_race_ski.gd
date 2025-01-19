extends Node2D

@onready var track = $Track
@onready var track2 = $Track2
@onready var track3 = $Track3

var track_to_player_mappings : Dictionary = {
	"track": "taco",
	"track2": "limone",
	"track3": "other_player"
}

var racer_distances :Dictionary =  {
	"taco": 0,
	"limone": 0,
	"thrid_racer": 0
}

var place_string_map : Dictionary = {
	0 : "1st",
	1: "2nd",
	2: "3rd"
}
var current_placings : Array[Dictionary] = []
var is_loaded : bool = false
var is_race_complete: bool = false
@export var completion_hud_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("countdown")
	load_course()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_loaded:
		racer_distances["taco"] = get_distance($TacoRaceSki.global_transform,track.global_transform, track.get_end_point_position())
		racer_distances["limone"] = get_distance($NpcCharacter.global_transform,track2.global_transform, track2.get_end_point_position())
		racer_distances["third_racer"] = get_distance($NpcCharacter2.global_transform,track3.global_transform, track3.get_end_point_position())
		
		var new_placings: Array[Dictionary] = []
		new_placings.append({
			"player": "taco",
			"distance": racer_distances["taco"]
		})
		new_placings.append({
			"player": "limone",
			"distance": racer_distances["limone"]
			})
		new_placings.append({
			"player": "third_racer",
			"distance": racer_distances["third_racer"]
		})
		new_placings.sort_custom(func (a,b): if a["distance"] < b["distance"]: return true else: return false)
		 
		if current_placings.size() != 0:
			for indx in new_placings.size():
				if new_placings[indx] != current_placings[indx]:
					update_hud(new_placings)
		else:
			update_hud(new_placings)
		pass

func update_hud(placings: Array[Dictionary]):
	var indx_found = placings.find({
		"player": "taco",
		"distance": racer_distances["taco"]
		
	})
	$PlaceHud.update_place(place_string_map[indx_found])
	current_placings = placings
	pass
	
func generate_obstacles(track,data_received):
	var taco_number_of_obstacles = randi_range(3,5)
	print(taco_number_of_obstacles)
	var list_of_locations = []
	for indx in range(1,taco_number_of_obstacles):
		var taco_pick_obstacle = randi_range(0,1)
		var type:String
		if taco_pick_obstacle == 0:
			type ="nacho_boulder"
		else:
			type = "cheese_boost"
		var location = randi_range(5, data_received["path_length"]/indx )
		while list_of_locations.has(location) == true:
			location = randi_range(5, data_received["path_length"]/indx )	
		var obstacle : Dictionary = 	{
				"type": type,
				"location": location,
				"is_sendable": false
		}
		list_of_locations.append(location)
		track.set_obstacle(obstacle)

func load_course():
	var file = FileAccess.open("res://levels/texico_race_ski/map_data_file.txt", FileAccess.READ)
	var content = file.get_as_text()
	var json = JSON.new()
	var error = json.parse(content)
	if error == OK:
		var data_received: Dictionary = json.data
		track.set_size(data_received["path_length"])
		track.object_name = "track"
		track.set_speed(data_received["speed"])
		track.race_complete.connect(race_completed)
		track2.set_size(data_received["path_length"])
		track2.object_name = "track2"
		track2.set_speed(data_received["speed"])
		track2.race_complete.connect(race_completed)
		track3.set_size(data_received["path_length"])
		track3.object_name = "track3"
		track3.set_speed(data_received["speed"])
		track3.race_complete.connect(race_completed)
		generate_obstacles(track,data_received)
		generate_obstacles(track2,data_received)
		generate_obstacles(track3,data_received)
		#for element in data_received["characters"]["taco"]["obstacles"]:
			#track.set_obstacle(element)
		#for element in data_received["characters"]["limone"]["obstacles"]:
			#track2.set_obstacle(element)
		#for element in data_received["characters"]["third_racer"]["obstacles"]:
			#track3.set_obstacle(element)
		
		$TacoRaceSki.track = track
		$NpcCharacter.track = track2
		$NpcCharacter2.track = track3
		
		
func get_distance(character_transform: Transform2D, track_transform: Transform2D, area_position: Vector2):
	var local_transform: Transform2D = track_transform.affine_inverse()
	var relative_position = local_transform * character_transform.origin
	#print(relative_position, " ", area_position)
	return relative_position.distance_to(area_position)

func race_completed(object_name):
	if is_race_complete == false:
		var completion_hud_instance = completion_hud_scene.instantiate()
		completion_hud_instance.title = track_to_player_mappings[object_name]
		get_tree().current_scene.add_child(completion_hud_instance)
		is_race_complete = true

func clear_countdown():
	$CountdownHud.queue_free()
	
func start_countdown_effect():
	$Countdown.play()
	
func start_background_music():
	$BackgroundMusic.play()
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "countdown":
		is_loaded = true
		get_tree().call_group("track","set_can_move", true)
		get_tree().call_group("track2","set_can_move", true)
		get_tree().call_group("track3","set_can_move", true)
		clear_countdown()
	pass # Replace with function body.
