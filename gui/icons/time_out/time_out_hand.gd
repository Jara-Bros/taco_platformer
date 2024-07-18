extends Node2D

@onready var taco: Player = $"../Taco"
@onready var time_out_hand: Node2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_out_hand.position.x += taco.position.x
	time_out_hand.position.y = taco.position.y
