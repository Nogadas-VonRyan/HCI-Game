extends Button


func _on_pressed():
	$"../AudioInput".value = -20
	$"../MouseSensitivityInput".value = 1200
