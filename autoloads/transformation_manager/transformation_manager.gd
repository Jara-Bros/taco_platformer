extends Node

func swap_transformation( _transform : Node2D ):
	call_deferred("add_child", _transform)
