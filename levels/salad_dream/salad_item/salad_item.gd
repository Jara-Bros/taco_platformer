extends RigidBody2D

@export var collected: bool = false
var player: Player
@export var offset: int = -40
var invincible : bool
var collect_tween : Tween
var just_spawned = false
var spawn_direction
@export_enum("KALE", "CHEESE", "TOMATOES") var item_type
var current_type
@export var pushForce = 500
@onready var sprite_2d: Sprite2D = $Sprite2D

var cheese_image = Image.load_from_file("res://levels/salad_dream/sprites/cheese_item.png")
var cheese_texture = ImageTexture.create_from_image(cheese_image)

var kale_image = Image.load_from_file("res://levels/salad_dream/sprites/kale_item.png")
var kale_texture = ImageTexture.create_from_image(kale_image)

var tomato_image = Image.load_from_file("res://levels/salad_dream/sprites/tomato_item.png")
var tomato_texture = ImageTexture.create_from_image(tomato_image)


func _ready():
	print(item_type)
	if item_type == 0:
		$Sprite2D.texture = kale_texture
		print($Sprite2D)
		current_type = "KALE"
	elif item_type == 1:
		$Sprite2D.texture = cheese_texture
		current_type = "CHEESE"
	elif item_type == 2:
		$Sprite2D.texture = tomato_texture
		current_type = "TOMATOES"


func _process(_delta):
	pass
	#if Input.is_action_just_pressed("item"):
		#collected = false
		#add_collision_layer()
		#ItemManager.clear_list()
		#$Timer.start()
		#invincible = true
		


func _physics_process(delta):
	if player != null and player.move_and_slide(): # true if collided
		for i in player.get_slide_collision_count():
			var col = player.get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -pushForce)

func _on_area_2d_body_entered(body):
	pass
	#if(body.is_in_group("Player") and invincible == false and collected == false and holding_bowl() == false and ItemManager.get_items_list() <= 2):
		#ItemManager.add_to_items_list(self)
		#var item_list_size = ItemManager.get_items_list()
		#if(item_list_size == 0):
			#offset = -40
		#else:
			#offset = -40 * (item_list_size)
		#
		#player = body
		#remove_collision_layer()
		#collect_tween = create_tween()
		#collect_tween.connect("finished", tween_complete)
		#invincible = true
		#set_collision_layer_value(4, false)
		#collect_tween.tween_property(self, "position", player.position + Vector2(0, offset), 0.15)
		#collected = true
	
func holding_bowl():
	var bowl = get_tree().get_first_node_in_group("bowl")
	if bowl.collected == true:
		return true
	return false

#func play_bounce_tween():
	#var tween : Tween = create_tween()
	#tween.tween_property(self, "global_position:y", -20, 0.75).as_relative().set_ease(Tween.EASE_OUT)
	#
func set_item_type(item):
	item_type = item

#func add_collision_layer():
	#set_collision_mask_value(1, true)
#
#func remove_collision_layer():
	#set_collision_mask_value(1, false)

func tween_complete():
	remove_invicibility()
	set_collision_layer_value(4, true)

func remove_invicibility():
	invincible = false

func _on_timer_timeout():
	remove_invicibility()


func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body
