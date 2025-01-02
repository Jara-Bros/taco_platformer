extends Area2D

@onready var anim_player: AnimationPlayer = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		anim_player.play("box_hit")
		var bowl = get_tree().get_first_node_in_group("bowl")
		bowl.clear()
		var bowl_hud = get_tree().get_first_node_in_group("bowl_hud")
		bowl_hud.clear()
	pass # Replace with function body.
