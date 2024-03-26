extends Node2D

@onready var MenuRect = Rect2($Menu.position,$Menu.size)
@onready var Selector = $Selector


func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		$Settings.visible = false

func _input(event):
	if event is InputEventMouse:
		if MenuRect.has_point(event.position):
			Selector.visible = true
			goToScene()
		else:
			Selector.visible = false

func goToScene():
	if Input.is_action_just_pressed("Click"):
				# Dont remove the Integer casting
				print(Selector.position.y)
				match Selector.position.y as int: 
					450:
						get_tree().change_scene_to_file("res://src/cutscenes/intro/scene.tscn")
					495:
						if $Settings.visible:
							$Settings.visible = false
						else:
							$Settings.visible = true
					540:
						get_tree().change_scene_to_file("res://src/menu/credits/credits.tscn")
					585:
						get_tree().quit()
					_:
						print("Cursor is pointing to nothing")
