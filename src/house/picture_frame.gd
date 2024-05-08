extends Interactable


func _ready():
	type = "PictureFrame"
	message = "Grandfather's Picture"

func interact():
	Global.getRoot().setDialogue("I wonder what happened to him...",0,2)
