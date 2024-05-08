extends Interactable


func _ready():
	type = "Diary"
	message = "Press [E] to take Diary"

func interact():
	message = ""
	get_parent().visible = false
	print(name)
	Global.getRoot().setDialogue("Press [i] to Open Inventory",1,5)
