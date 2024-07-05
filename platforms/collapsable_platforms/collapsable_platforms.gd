extends AnimatableBody2D

signal completed_movement

@onready var collapse_timer = $CollapseTimer

enum broke_state {UNBROKEN, BROKEN}
var current_state

# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = broke_state.UNBROKEN
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_state == broke_state.BROKEN:
		rotation +=  400 * delta
	if rotation_degrees > 90:
		completed_movement.emit()


func _on_collapse_timer_timeout():
	current_state = broke_state.BROKEN
	


func _on_completed_movement():
	queue_free()


func _on_area_2d_body_entered(body):
	if body.get_name() == "Taco":
		collapse_timer.start()
