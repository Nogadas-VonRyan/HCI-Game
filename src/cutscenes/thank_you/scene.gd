extends Control


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _input(_event):
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file.call_deferred("res://src/menu/scene.tscn")
