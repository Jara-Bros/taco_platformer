extends Node2D

@onready var taco: Player = $Taco


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass
	


func _on_push_force_changed_body_entered(body: Node2D) -> void:
	# To enable taco's push force for eight pans
	taco.push_force = 20
