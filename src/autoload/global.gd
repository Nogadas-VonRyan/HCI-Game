extends Node


func getRoot():
	return get_tree().root.get_child( get_tree().root.get_child_count() - 1 )
