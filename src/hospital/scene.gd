extends Node3D

@onready var Player = $Player

func _ready():
	pass


func _process(delta):
	pass


func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func _on_player_pointing_at_interactable(collided):
	Player.setCenterMessage("Press [E] to Interact")
	if Input.is_action_just_pressed("interact"):
		if collided.isOpen:
			collided.close()
		else:
			collided.open()


func _on_player_not_pointing_at_interactable():
	Player.setCenterMessage("")	
