extends HSlider

func _process(_delta):
	if not visible:
		return
	
	AudioHandler.master_volume = value
