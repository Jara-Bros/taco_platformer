extends Node2D


@onready var anim_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	var max_balls := 5
	if get_child_count() < max_balls:
		anim_player.play("spawn_ball")


func spawn_ball():
	var lettuce_ball : Node2D
	lettuce_ball = load("res://taco/Item/soccer_ball/soccer_ball.tscn").instantiate()
	add_child(lettuce_ball)


func _on_ball_queue_free_body_entered(body: Node2D) -> void:
	if body.is_in_group("soccer_ball"):
		body.queue_free()
