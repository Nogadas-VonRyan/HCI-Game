extends Interactable


@onready var Door = $"../../AnimationPlayer"
@onready var isOpen = false
@export var hasLock = false

func _ready():
	type = "Door"
	message = "Press [E] to Interact"
	priority = 2

func interact():
	if isOpen:
		close()
	else:
		open()

func open():
	if hasLock or Door.is_playing():
		return
	Door.play("open_door")
	isOpen = true
	
func close():
	if Door.is_playing():
		return
	Door.play("close_door")
	isOpen = false
