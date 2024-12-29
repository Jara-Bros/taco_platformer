extends ColorRect

@onready var kale_light_1: ColorRect = $Kale1
@onready var kale_light_2: ColorRect = $Kale2
@onready var kale_light_3: ColorRect = $Kale3
@onready var cheese_light_1: ColorRect = $Cheese1
@onready var cheese_light_2: ColorRect = $Cheese2
@onready var cheese_light_3: ColorRect = $Cheese3
@onready var tomato_light_1: ColorRect = $Tomato1
@onready var tomato_light_2: ColorRect = $Tomato2
@onready var tomato_light_3: ColorRect = $Tomato3

var base_color : Color = Color("272727")
var light_up_color: Color = Color("00a20f")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func increment_kale():
	if kale_light_1.color.is_equal_approx(base_color):
		kale_light_1.color = light_up_color
		return true
	elif kale_light_2.color.is_equal_approx(base_color):
		kale_light_2.color = light_up_color
		return true
	elif kale_light_3.color.is_equal_approx(base_color):
		kale_light_3.color = light_up_color
		return true
	else:
		return false
	
func increment_cheese():
	if cheese_light_1.color.is_equal_approx(base_color):
		cheese_light_1.color = light_up_color
		return true
	elif cheese_light_2.color.is_equal_approx(base_color):
		cheese_light_2.color = light_up_color
		return true
	elif cheese_light_3.color.is_equal_approx(base_color):
		cheese_light_3.color = light_up_color
		return true
	else:
		return false
func increment_tomato():
	if tomato_light_1.color.is_equal_approx(base_color):
		tomato_light_1.color = light_up_color
		return true
	elif tomato_light_2.color.is_equal_approx(base_color):
		tomato_light_2.color = light_up_color
		return true
	elif tomato_light_3.color.is_equal_approx(base_color):
		tomato_light_3.color = light_up_color
		return true
	else:
		return false
func clear():
	kale_light_1.color = base_color
	kale_light_2.color = base_color 
	kale_light_3.color = base_color
	cheese_light_1.color =  base_color 
	cheese_light_2.color = base_color
	cheese_light_3.color = base_color
	tomato_light_1.color = base_color
	tomato_light_2.color = base_color
	tomato_light_1.color = base_color
	 
