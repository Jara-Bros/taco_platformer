extends StaticBody2D

@export var salad_item_packed_scene : PackedScene
@export_enum("KALE", "CHEESE", "TOMATOES") var type
#signal item_created(item)
@export var spawn_direction: int = 1

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var anim_player_2: AnimationPlayer = $"../CheeseBox/AnimationPlayer"


# Called when the node enters the scene tree for the first time.
func _ready():
 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


 
func _on_salad_item_box_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Player")) and is_under(body):
		anim_player.play("box_hit")
		anim_player_2.play("box_hit")
		var salad_instance = salad_item_packed_scene.instantiate()
		salad_instance.set_item_type(type)
		salad_instance.position = position + Vector2(0, -50)
		salad_instance.just_spawned = true
		salad_instance.spawn_direction = spawn_direction
		get_tree().current_scene.call_deferred("add_child", salad_instance)

func is_under(body) -> bool:
	if body.position.y > position.y and (body.position.x >= position.x -  $SaladItemBox/CollisionShape2D.shape.get_rect().size.x and body.position.x < position.x + $SaladItemBox/CollisionShape2D.shape.get_rect().size.x):
		return true
	return false
