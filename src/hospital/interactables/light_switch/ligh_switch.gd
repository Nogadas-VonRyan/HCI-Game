extends Interactable

@export var Light: OmniLight3D

func _ready():
	type = "LightSwitch"
	message = "Press [E] to Turn On Lights"

func turnOn():
	Light.visible = true
	
func turnOff():
	Light.visible = false
	
func interact():
	if Light.visible:
		turnOff()
	else:
		turnOn()
