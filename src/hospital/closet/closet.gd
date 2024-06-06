extends Interactable


@onready var animation = $AnimationPlayer
var isOpen = false

func _ready():
	type = "Closet"
	message = "Press [E] to open"

func interact():
	print('test')
	if isOpen:
		isOpen = false
		animation.play("close_door")
	else:
		isOpen = true
		animation.play("open_door")
