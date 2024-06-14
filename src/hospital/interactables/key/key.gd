extends Interactable


func _ready():
	type = "Key"
	message = 'Press [E] to take'


func interact():
	$"../".hide()
	$CollisionShape3D.disabled = true
