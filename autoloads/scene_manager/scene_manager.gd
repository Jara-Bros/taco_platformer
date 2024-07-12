extends Node

func start_scene (_scene : Node2D):
	call_deferred("add_child", _scene)

func change_scenes (_scene : Node2D ):
	call_deferred("remove_child", get_child(0))
	call_deferred("add_child", _scene)
