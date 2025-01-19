extends Sprite2D


@onready var interaction_area: InteractionArea = $InteractionArea
@onready var anim_player: AnimationPlayer = $"../AnimationPlayer"



func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	anim_player.play("corpo_box_open")
