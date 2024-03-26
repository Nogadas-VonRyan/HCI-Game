extends Control

@onready var Selector = $Selector
@onready var ResumeButtom = $Background/HBoxContainer/VBoxContainer/ResumeButton
@onready var SettingsButtom = $Background/HBoxContainer/VBoxContainer/SettingsButton
@onready var MainMenuButtom = $Background/HBoxContainer/VBoxContainer/MainMenuButton

func setSelectorPosition(node: Label):
	Selector.visible = true
	Selector.position.y = node.position.y + $Background.position.y
	
func unsetSelectorPosition():
	Selector.visible = false


func _on_resume_button_mouse_entered():
	setSelectorPosition(ResumeButtom)


func _on_resume_button_mouse_exited():
	unsetSelectorPosition()


func _on_settings_button_mouse_entered():
	setSelectorPosition(SettingsButtom)


func _on_settings_button_mouse_exited():
	unsetSelectorPosition()


func _on_main_menu_button_mouse_entered():
	setSelectorPosition(MainMenuButtom)


func _on_main_menu_button_mouse_exited():
	unsetSelectorPosition()
