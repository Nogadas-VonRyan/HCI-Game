extends Control

@onready var Selector = $Selector
@onready var ResumeButtom = $Background/Menu/VBoxContainer/ResumeButton
@onready var SettingsButtom = $Background/Menu/VBoxContainer/SettingsButton
@onready var MainMenuButtom = $Background/Menu/VBoxContainer/MainMenuButton
@onready var ResetButton = $Background/Menu/VBoxContainer/ResetButton

@onready var YesConfirmButton = $Background/ConfirmMenu/Confirmation/Yes
@onready var NoConfirmButton = $Background/ConfirmMenu/Confirmation/No

func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func _input(_event):
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.is_action_just_pressed("Click"):
		print(get_tree().paused)
	
	# Close the pause menu submenus first
	if Input.is_action_just_pressed("ui_cancel") and $Settings.visible:
		$Settings.hide()
		$Background.show()
		$Selector.show()
	
	# Close it for real
	elif Input.is_action_just_pressed("ui_cancel") and visible:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		hide()
		$"..".stopTransition = true
		get_tree().paused = false


func setSelectorPosition(node: Label):	
	Selector.visible = true
	Selector.position.y = node.global_position.y
	
func unsetSelectorPosition():
	Selector.visible = false


func _on_background_gui_input(_event):
	unsetSelectorPosition()

func _on_resume_button_gui_input(_event):
	setSelectorPosition(ResumeButtom)
	if Input.is_action_just_pressed("Click"):
		get_tree().paused = false
		visible = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_settings_button_gui_input(_event):
	setSelectorPosition(SettingsButtom)
	if Input.is_action_just_pressed("Click"):
		$Settings.show()
		$Background.hide()
		$Selector.hide()


func _on_main_menu_button_gui_input(_event):
	setSelectorPosition(MainMenuButtom)
	if Input.is_action_just_pressed("Click"):
		# get_tree().paused = false
		# get_tree().change_scene_to_file.call_deferred("res://src/menu/scene.tscn")
		$Background/Menu.hide()
		$Background/ConfirmMenu.show()
		unsetSelectorPosition()


func _on_reset_button_gui_input(_event):
	setSelectorPosition(ResetButton)
	if Input.is_action_just_pressed("Click"):
		var Player = Global.getRoot().get_node('Player')
		Player.global_position.x = -52.041
		Player.global_position.y = 11.304
		Player.global_position.z = 32.31
		
		
		var zombie = Global.getRoot().get_node('Enemies').get_node('skinny_zombie')
		zombie.global_position.x = -28.89
		zombie.global_position.y = 11.26
		zombie.global_position.z = 21.15
		zombie.follow_player()
		
		get_tree().paused = false
		visible = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


# Confirmation on Exit Menu

func _on_yes_gui_input(_event):
	setSelectorPosition(YesConfirmButton)
	if Input.is_action_just_pressed("Click"):
		get_tree().paused = false
		get_tree().change_scene_to_file.call_deferred("res://src/menu/scene.tscn")


func _on_no_gui_input(_event):
	setSelectorPosition(NoConfirmButton)
	if Input.is_action_just_pressed("Click"):
		$Background/ConfirmMenu.hide()
		$Background/Menu.show()
		unsetSelectorPosition()
