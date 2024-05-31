extends Node3D

@onready var timer = $Timer 
@onready var plank_nodes = $planks.get_children()

func fall_down():
	for plank_node in plank_nodes:
		plank_node.freeze = false
	
	$StaticBody3D/CollisionShape3D.disabled = true
	timer.start(2.5)

func _on_timer_timeout():
	for plank_node in plank_nodes:
		plank_node.freeze = true
