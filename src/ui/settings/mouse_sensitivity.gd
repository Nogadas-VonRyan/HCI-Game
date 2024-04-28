extends HSlider

func _process(_delta):
	var diff = max_value - value + 1
	InputHandler.mouse_sensitivity = diff
