extends StaticBody2D

@export var salad_item_packed_scene : PackedScene
@export_enum("KALE", "CHEESE", "TOMATOES") var type
#signal item_created(item)
@export var spawn_direction: int = 1

@onready var anim_player: AnimationPlayer = $"../KaleBox/Sprite2D/AnimationPlayer"


# Called when the node enters the scene tree for the first time.
func _ready():
 
	pass # Replace with function body.


 
func _on_salad_item_box_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Player")) and is_under(body):

		var salad_instance = salad_item_packed_scene.instantiate()
		salad_instance.set_item_type(type)
		if type == 0:
			anim_player.play("box_hit")
		if type == 1:
			anim_player.play("box_hit_3")
		if type == 2:
			anim_player.play("box_hit_2")
		salad_instance.position = position + Vector2(0, -75)
		salad_instance.apply_impulse(Vector2(spawn_direction * 40,-200),salad_instance.position)
		get_tree().current_scene.call_deferred("add_child", salad_instance)

func is_under(body) -> bool:
	if body.position.y > position.y and (body.position.x >= position.x -  $SaladItemBox/CollisionShape2D.shape.get_rect().size.x and body.position.x < position.x + $SaladItemBox/CollisionShape2D.shape.get_rect().size.x):
		return true
	return false
