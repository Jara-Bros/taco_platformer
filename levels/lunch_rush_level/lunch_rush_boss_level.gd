extends Node2D

@onready var taco: Player = $Taco

@onready var initial_camera: Camera2D = $KitchenEncounterSection/InitialCamera

# For soup ingredient bob animation
@onready var anim_player_p: AnimationPlayer = $SoupSection/Potato/AnimationPlayer
@onready var anim_player_c: AnimationPlayer = $SoupSection/Corn/AnimationPlayer
@onready var anim_player_p2: AnimationPlayer = $SoupSection/Potato2/AnimationPlayer
@onready var anim_player_c2: AnimationPlayer = $SoupSection/Corn2/AnimationPlayer



func _ready() -> void:
	#$GrillSection/Button.callable = func(fire_array):
		#for grill_fire in fire_array:
			#var grill_fire_node = get_node(grill_fire)
			#grill_fire_node.queue_free()
	pass

func _process(_delta: float) -> void:
	pass
	

func _on_push_force_changed_body_entered(_body: Node2D) -> void:
	# To enable taco's push force for eight pans
	taco.push_force = 20


func _on_button_generic_signal() -> void:
	var taco_node = get_tree().get_nodes_in_group("Player")[0]
	taco_node.position = Vector2(3584, 416)


# TODO connect the potato & corn signals 

# For the soup ingredient bob animation
func _on_area_2d_body_entered(body: Node2D) -> void:
	anim_player_p.play("move_down")


func _on_area_2d_body_exited(body: Node2D) -> void:
	anim_player_p.play("move_up")


func _on_area_2d_body_c_exited(body: Node2D) -> void:
	pass # Replace with function body.
