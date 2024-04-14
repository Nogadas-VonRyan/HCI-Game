extends HSlider

func _process(delta):
	var diff = max_value - value + 1
	InputHandler.mouse_sensitivity = diff
