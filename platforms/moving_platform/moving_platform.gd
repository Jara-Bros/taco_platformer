extends Path2D

@export var speed : float
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	$AnimationPlayer.play("moving")
	set_process(false)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$PathFollow2D.progress += speed
	pass
