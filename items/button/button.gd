extends Area2D

@export var call_arguments = []
signal generic_signal
var callable : Callable = func():
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if callable != null:
		callable.call(call_arguments)
	if generic_signal.is_null() == false:
		generic_signal.emit()
	call_deferred("queue_free")
