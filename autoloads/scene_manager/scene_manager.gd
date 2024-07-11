extends Node

func swap_scenes(_scene : Node2D ):
	call_deferred("add_child", _scene)

func change_scenes(pscene : PackedScene):
	call_deferred("add_child", pscene)
