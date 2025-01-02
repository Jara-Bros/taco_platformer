extends Node2D

@onready var kale_check_1: Sprite2D = $KaleCheck1
@onready var kale_check_2: Sprite2D = $KaleCheck2
@onready var kale_check_3: Sprite2D = $KaleCheck3

@onready var cheese_check_1: Sprite2D = $CheeseCheck1
@onready var cheese_check_2: Sprite2D = $CheeseCheck2
@onready var cheese_check_3: Sprite2D = $CheeseCheck3

@onready var tom_check_1: Sprite2D = $TomCheck1
@onready var tom_check_2: Sprite2D = $TomCheck2
@onready var tom_check_3: Sprite2D = $TomCheck3


func increment_kale():
	if kale_check_1.frame == 0:
		kale_check_1.frame = 1
		return true
	elif kale_check_2.frame == 0:
		kale_check_2.frame = 1
		return true
	elif kale_check_3.frame == 0:
		kale_check_3.frame = 1
		return true
	else:
		return false
	
	
func increment_cheese():
	if cheese_check_1.frame == 0:
		cheese_check_1.frame = 1
		return true
	elif cheese_check_2.frame == 0:
		cheese_check_2.frame = 1
		return true
	elif cheese_check_3.frame == 0:
		cheese_check_3.frame = 1
		return true
	else:
		return false
		
		
func increment_tomato():
	if tom_check_1.frame == 0:
		tom_check_1.frame = 1
		return true
	elif tom_check_2.frame == 0:
		tom_check_2.frame = 1
		return true
	elif tom_check_3.frame == 0:
		tom_check_3.frame = 1
		return true
	else:
		return false
		
		
func clear():
	kale_check_1.frame = 0
	kale_check_2.frame = 0
	kale_check_3.frame = 0
	cheese_check_1.frame = 0
	cheese_check_2.frame = 0
	cheese_check_3.frame = 0
	tom_check_1.frame = 0
	tom_check_2.frame = 0
	tom_check_3.frame = 0
