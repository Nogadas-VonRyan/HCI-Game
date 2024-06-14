class_name Interactable extends StaticBody3D


var message = "Press [E] to Interact"
var type = "None"
@export var priority = 1

func setInactive():
	type = ""
	message = ""
	collision_layer = 0

