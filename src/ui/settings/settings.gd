extends Panel


func _ready():
	$Grid/AudioInput.value = AudioHandler.master_volume
	$Grid/MouseSensitivityInput.value = InputHandler.mouse_sensitivity
