extends Node2D

@onready var taco: Player = $Taco
@onready var sauced_timer: Timer = $Sauced/SaucedTimer
@onready var sauced_area: Area2D = $Sauced


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass
	


func _on_push_force_changed_body_entered(body: Node2D) -> void:
	
	# To enable taco's push force for eight pans
	taco.push_force = 20



func _on_sauced_body_entered(body: Node2D) -> void:
	# To mimic slow movement
	taco.speed /= 3
	taco.jump_velocity /= 1.5


func _on_sauced_body_exited(body: Node2D) -> void:
	# Restore default movement
	taco.speed *= 3
	taco.jump_velocity *= 1.5
