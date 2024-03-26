extends Node3D

@onready var Player = $Player
@onready var World = $WorldEnvironment
@onready var CRT = $CRT
var nightvision = false

func _ready():
	$pause_menu.visible = false
	print(World.environment.background_color)
	pass

func _unhandled_input(event):
	if Input.is_action_just_pressed("flashlight"):
		if nightvision:
			World.environment.background_color = Color(0.03,0.03,0.03)
			CRT.visible = false
			nightvision = false
			var light: OmniLight3D = World.get_node("OmniLight3D")
			light.light_energy = 1
			light.light_color = Color(1,1,1)
		else:
			World.environment.background_color = Color(0.1647, 0.502, 0.1098, 1)
			CRT.visible = true
			nightvision = true
			var light: OmniLight3D = World.get_node("OmniLight3D")
			light.light_color = Color(0.5608, 1, 0.4392)
			light.light_energy = 15
		pass
	
	if Input.is_action_just_pressed("ui_cancel"):
		if $pause_menu.visible:
			print($pause_menu.visible)
			$pause_menu.visible = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			$pause_menu.visible = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.is_action_just_pressed("1"):
		$Player/Head/Camera3D.current = not $Player/Head/Camera3D.current
		if $Player/Head/Camera3D.current:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if Input.is_action_just_pressed("Quit"):
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


func _on_password_lock1_success():
	print("success")
	$Player/Head/Camera3D.current = not $Player/Head/Camera3D.current
	if $Player/Head/Camera3D.current:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$PasswordLockModel.visible = false	
