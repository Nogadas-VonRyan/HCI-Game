extends Interactable


@onready var Door = $"../../AnimationPlayer"
@onready var isOpen = false

func _ready():
	name = "Door"
	message = "Press[E] to Interact"

func interact():
	if isOpen:
		close()
	else:
		open()

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
