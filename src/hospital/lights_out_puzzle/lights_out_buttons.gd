extends Interactable

@onready var camera = $"../Camera3D"

func _ready():
	type = "LightsOut"
	message = "Press [E] to interact"

func interact():
	camera.current = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$CollisionShape3D.disabled = true
	Global.getRoot().get_node('Player').disable_player = true
