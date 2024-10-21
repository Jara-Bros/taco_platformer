extends Node2D

@onready var taco: Player = $Taco

@onready var initial_camera: Camera2D = $KitchenEncounterSection/InitialCamera

func _ready() -> void:
	#initial_camera.make_current()
	pass

func _process(_delta: float) -> void:
	pass
	


func _on_push_force_changed_body_entered(_body: Node2D) -> void:
	# To enable taco's push force for eight pans
	taco.push_force = 20
