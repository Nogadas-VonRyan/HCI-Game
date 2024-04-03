extends Node3D


func disable():
	hide()
	$StaticBody3D/CollisionShape3D.disabled = true
	pass
