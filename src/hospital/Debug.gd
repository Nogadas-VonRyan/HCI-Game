extends Control

@onready var player = Global.getRoot().get_node("Player")
@onready var x = $x
@onready var y = $y
@onready var z = $z

func _process(delta):
	x.text = str(player.global_position.x)
	y.text = str(player.global_position.y)
	z.text = str(player.global_position.z)
