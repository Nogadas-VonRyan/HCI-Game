extends Interactable

var is_light_on = false

func _ready():
	type = "LightSwitch"
	message = "Press [E] to Turn On Lights"

func interact(light,light2):
	if is_light_on:
		light.light_color = Color(0.31,0.31,0.31,1)
		light2.light_color = Color(0.31,0.31,0.31,1)
		is_light_on = false
	else:
		light.light_color = Color(1,1,1,1)
		light2.light_color = Color(1,1,1,1)
		is_light_on = true
