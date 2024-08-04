extends Area2D

@onready var taco: Player = $"../Taco"
@onready var woz_house_interior: Node2D = $".."


signal leave_woz(data)

func _on_body_entered(body: Node2D) -> void:
	leave_woz.emit({
		"player_spawn_location": Vector2(-225, -25)
	})
