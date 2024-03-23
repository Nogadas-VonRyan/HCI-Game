extends StaticBody3D
class_name Interactable

@onready var Door = $"../../AnimationPlayer"
@onready var isOpen = false

func open():
	Door.play("open_door")
	isOpen = true
	
func close():
	Door.play("close_door")
	isOpen = false
