extends StaticBody2D


@onready var raycast: RayCast2D = $RayCast2D
@onready var anim_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_raycast()


func check_raycast():
	if raycast.is_node_ready():
		if raycast.is_colliding():
			anim_player.play("fall")
			raycast.set("enabled", false)
