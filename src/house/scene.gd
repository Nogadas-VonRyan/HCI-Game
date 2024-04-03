extends Node3D

@onready var light: OmniLight3D = $Lights/OmniLight3D
@onready var light2: OmniLight3D = $Lights/OmniLight3D2
@onready var Player: CharacterBody3D = $Player
@onready var CenterMessage: Label = $CenterMessage

enum COMPLETION_FLAGS {
	LIGHTS_ON,
	FOUND_BOOK
}
var COMPLETED_FLAGS = []

func _ready():
	process_mode = Node.PROCESS_MODE_PAUSABLE
	$PauseMenu.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file.call_deferred("res://src/hospital/scene.tscn")
	
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
		
	if Input.is_action_just_pressed("ui_cancel"):
		if $PauseMenu.visible:
			$PauseMenu.visible = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			get_tree().paused = true
			$PauseMenu.visible = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.is_action_just_pressed("ui_down"):
		get_tree().change_scene_to_file.call_deferred("res://src/hospital/scene.tscn")

func _on_player_pointing_at_interactable(collided: StaticBody3D):
	if Input.is_action_just_pressed("interact"):
		#environment.environment.background_color = Color(0.5098, 0.5098, 0.5098, 1)
		light.light_color = Color(1,1,1,1)
		light2.light_color = Color(1,1,1,1)
	CenterMessage.visible = true
	CenterMessage.text = collided.message
	$Markers/LightMarker.visible = false
	$Markers/BookMarker.visible = true
	$Markers/Label3D.visible = true


func _on_player_not_pointing_at_interactable():
	CenterMessage.visible = false
	pass
