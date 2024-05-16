extends Interactable


func _ready():
	type = "Door"
	message = "Press [E] to Exit"

func interact(hasDiary):
	if hasDiary:
		get_tree().change_scene_to_file.call_deferred("res://src/cutscenes/to_hospital/scene.tscn")
	else:
		Global.getRoot().setDialogue("I need to find some clues about my grandpa first",0,3)
