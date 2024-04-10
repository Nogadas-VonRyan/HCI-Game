extends Control

@onready var MenuRect = Rect2($Menu.position,$Menu.size)
@onready var Selector = $Selector

func _ready():
	$SubViewportContainer/SubViewport/Camera3D2.current = true
	pass

func _process(_delta):
	$SubViewportContainer/SubViewport/crimson_ledger.rotation.x += 0.001
	$SubViewportContainer/SubViewport/crimson_ledger.rotation.y += 0.001
	$SubViewportContainer/SubViewport/crimson_ledger.rotation.z += 0.001

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		$Settings.visible = false
		$Menu.visible = true
		$Blur.visible = false

func _input(event):
	if $Menu.visible and event is InputEventMouse:
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
						get_tree().change_scene_to_file.call_deferred("res://src/cutscenes/intro/scene.tscn")
					495:
						if $Settings.visible:
#							$Settings.visible = false
#							$Blur.visible = false
#							$Menu.visible = true
#							print("occur")
							pass
						else:
							$Settings.visible = true
							$Blur.visible = true
							$Menu.visible = false
							Selector.visible = false
					540:
						get_tree().change_scene_to_file.call_deferred("res://src/menu/credits/credits.tscn")
					585:
						get_tree().quit()
					_:
						print("Cursor is pointing to nothing")
