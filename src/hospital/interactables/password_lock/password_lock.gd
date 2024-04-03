extends Interactable


@export var Player: CharacterBody3D
@onready var Cam: Camera3D = Player.get_node("Head").get_node("Camera3D")
var isSolved = false

func _ready():
	print(collision_layer)
	type = "PasswordLock"
	message = "Press [E] to Examine"

func interact():
	Cam.current = not Cam.current
	if Cam.current:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


