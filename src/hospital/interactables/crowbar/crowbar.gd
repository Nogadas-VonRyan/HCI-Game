extends Interactable


func _ready():
	type = "Crowbar"
	message = "Press [E] to Take"


func interact():
	print($"..")
	$"..".hide()
	$CollisionShape3D.disabled = true
