extends Area2D

var items : int
var player : Player = null
@export var full : bool = false
var collected : bool = false
var collect_tween : Tween
var invincible : bool = false
@export var on_conveyer: bool
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_just_pressed("item") and $Label.visible:
		item_tween()
	
	if collected == true and invincible == false:
		position = player.position + Vector2(0, -40) 
	if on_conveyer:
		position.x += 50 * delta



func _on_area_entered(area):
	if full == false:
		items += 1
		area.get_parent().queue_free()
	
	# do this to initiate glowing sequence
	if items == 3:
		full = true
		
func item_tween():
	collect_tween = create_tween()
	collect_tween.connect("finished", tween_complete)
	invincible = true
	set_collision_layer_value(4, false)
	collected = true
	collect_tween.tween_property(self, "position", player.position + Vector2(0, -40), 0.3)

func tween_complete():
	set_collision_layer_value(4, true)
	invincible = false
func _on_body_entered(body):
	if body.is_in_group("Player") and full:
		$Label.visible = true
		player = body
		


func _on_body_exited(body):
	$Label.visible = false
	pass # Replace with function body.
