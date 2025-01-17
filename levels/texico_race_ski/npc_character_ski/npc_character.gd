extends RigidBody2D


@onready var animation_player:AnimationPlayer


var is_stunned : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is AnimationPlayer:
			animation_player = child
			



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	apply_impulse(Vector2(0,-50))
	pass # Replace with function body.

func spin_out():
	animation_player.play("spin_out")
	is_stunned = true
	$StunnedTimer.start()


func _on_stunned_timer_timeout():
	is_stunned = false
	pass # Replace with function body.
