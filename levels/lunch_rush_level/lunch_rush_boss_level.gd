extends Node2D


@onready var taco: Player = $Taco

@onready var initial_camera: Camera2D = $KitchenEncounterSection/InitialCamera

# For soup ingredient bob animation
@onready var anim_player_carr: AnimationPlayer = $SoupSection/Carrot/AnimationPlayer
@onready var anim_player_carr2: AnimationPlayer = $SoupSection/Carrot2/AnimationPlayer


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


# For the soup ingredient bob animation
func _on_area_2d_body_entered_carr(_body: Node2D) -> void:
	anim_player_carr.play("move_down")


func _on_area_2d_body_exited_carr(_body: Node2D) -> void:
	anim_player_carr.play("move_up")


func _on_area_2d_body_entered_carr2(_body: Node2D) -> void:
	anim_player_carr2.play("move_down")


func _on_area_2d_body_exited_carr2(_body: Node2D) -> void:
	anim_player_carr2.play("move_up")
