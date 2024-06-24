extends Control

@onready var MenuRect = Rect2($Menu.position,$Menu.size)
@onready var Selector = $Selector
@onready var StartButton = $Menu/StartButton
@onready var SettingButton = $Menu/SettingButton
@onready var CreditButton = $Menu/CreditButton
@onready var ExitButton = $Menu/ExitButton

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

func _on_start_button_gui_input(event):
	Selector.position.y = StartButton.global_position.y
	Selector.visible = true
	
	if Input.is_action_just_pressed("Click"):
		get_tree().change_scene_to_file.call_deferred("res://src/cutscenes/intro/scene.tscn")

func _on_setting_button_gui_input(event):
	Selector.position.y = SettingButton.global_position.y
	Selector.visible = true
	
	if Input.is_action_just_pressed("Click"):
		if $Settings.visible:
			$Settings.visible = false
			$Blur.visible = false
		else:
			$Settings.visible = true
			$Blur.visible = true


func _on_credits_gui_input(event):
	Selector.position.y = CreditButton.global_position.y
	Selector.visible = true
	
	if Input.is_action_just_pressed("Click"):
		get_tree().change_scene_to_file.call_deferred("res://src/menu/credits/credits.tscn")


func _on_exit_button_gui_input(event):
	Selector.position.y = ExitButton.global_position.y
	Selector.visible = true
	
	if Input.is_action_just_pressed("Click"):
		get_tree().quit()


func _on_main_gui_input(event):
	Selector.visible = false
