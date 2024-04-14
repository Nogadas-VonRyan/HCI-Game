extends AudioStreamPlayer

@export var offset = 0 

func _process(_delta):
	volume_db = AudioHandler.master_volume + offset
