extends HSlider

func _on_value_changed(value):
	var diff = max_value - value + 1
	InputHandler.mouse_sensitivity = diff
