extends Interactable

@onready var Door = $"../../AnimationPlayer"
@onready var isOpen = false

func open():
	if Door.is_playing():
		return
	Door.play("open_door")
	isOpen = true
	
func close():
	if Door.is_playing():
		return
	Door.play("close_door")
	isOpen = false
