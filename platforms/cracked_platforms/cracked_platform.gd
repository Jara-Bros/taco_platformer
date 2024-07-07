extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	var bleu = get_tree().get_nodes_in_group("bleu")[0]  
	bleu.set_stuck_platform(get_instance_id())
