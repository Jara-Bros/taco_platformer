extends CharacterBody2D

@export var collected: bool = false
var player: Player
@export var offset: int = -40
var invincible : bool
var collect_tween : Tween
@export_enum("KALE", "LETTUCE", "TOMATOES") var item_type
var current_type
# Called when the node enters the scene tree for the first time.
func _ready():
	if item_type == 0:
		$ColorRect.color = Color.GREEN
		current_type = "KALE"
	elif item_type == 1:
		$ColorRect.color = Color.AZURE
		current_type = "LETTUCE"
	elif item_type == 2:
		$ColorRect.color = Color.RED
		current_type = "TOMATOES"
	$Label.text = current_type

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("item"):
		collected = false
		add_collision_layer()
		ItemManager.clear_list()
		$Timer.start()
		invincible = true
		


func _physics_process(delta):

	if not is_on_floor() and not collected:
		velocity.y += 450 * delta
	if collected and collect_tween.is_running() == false:
		position = player.position + Vector2(0, offset)
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if(body.is_in_group("Player") and invincible == false):
		ItemManager.add_to_items_list(self)
		var item_list_size = ItemManager.get_items_list()
		if(item_list_size == 0):
			offset = -40
		else:
			offset = -40 * (item_list_size)
		
		player = body
		remove_collision_layer()
		collect_tween = create_tween()
		collect_tween.connect("finished", tween_complete)
		invincible = true
		set_collision_layer_value(4, false)
		collect_tween.tween_property(self, "position", player.position + Vector2(0, offset), 0.15)
		collected = true

func set_item_type(item):
	item_type = item

func add_collision_layer():
	set_collision_mask_value(1, true)

func remove_collision_layer():
	set_collision_mask_value(1, false)

func tween_complete():
	remove_invicibility()
	set_collision_layer_value(4, true)

func remove_invicibility():
	invincible = false

func _on_timer_timeout():
	remove_invicibility()
