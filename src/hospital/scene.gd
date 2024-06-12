extends Node3D

@onready var Player = $Player
@onready var World = $WorldEnvironment
@onready var CenterMessage = $CenterMessage
@onready var Audio = $AudioStreamPlayer
@onready var Inventory = $Inventory
@onready var PauseMenu = $PauseMenu
@onready var Objectives = $Objectives

var isPasswordLock1Complete = false
var hasCrowbar = false
var stopTransition: bool = false

var foundPages := 1

func _ready():
	PauseMenu.visible = false
	Audio.stream.loop = true
	Audio.play()
	
	$Darkness/AnimationPlayer.play("fade_in")
	$Objectives.addObjective("find_pages","Find out the missing diary pages [1/10]")
	

func _input(_event):
	if Input.is_action_pressed("Click"):
		if hasCrowbar:
			$Player/Head/Camera3D/no_depth_crowbar/AnimationPlayer.play("swing")
			$Player/Head/Camera3D/no_depth_crowbar/AnimationPlayer.queue("RESET")

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		if not $Player/Head/Camera3D.current:
			$Player/Head/Camera3D.current = true
			Player.disable_player = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		elif not PauseMenu.visible and not stopTransition:
			get_tree().paused = true
			PauseMenu.visible = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		elif stopTransition:
			stopTransition = false
	
	if not Inventory.visible and Input.is_action_just_pressed("inventory"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		Inventory.visible = true
		get_tree().paused = true
			
	#if Input.is_action_just_pressed("Quit"):
	#	get_tree().quit()
	if Input.is_action_just_pressed("1"):
		$Player/Head/Camera3D.current = true
		
func _on_player_pointing_at_interactable(collided):
	CenterMessage.visible = true
	CenterMessage.text = collided.message
	if (Input.is_action_just_pressed("interact")) and collided is Interactable:
		match collided.type:
			"Door":
				if isPasswordLock1Complete and collided.hasLock:
					collided.hasLock = false
				if not collided.Door.is_playing() and collided.isOpen:
					$DoorClose.play()
				elif not collided.Door.is_playing() and not collided.hasLock:
					$DoorOpen.play()
				elif not collided.Door.is_playing():
					$DoorLocked.play()
				collided.interact()
			"DiaryPage":
				if collided.visible:
					Inventory.addDiaryPage(collided)
					collided.interact()
			"LightSwitch":
				collided.interact()
			"PasswordLock":
				CenterMessage.visible = false
				Player.disable_player = true
				collided.interact()
			"Boards":
				if hasCrowbar:
					$BoardedDoor1.fall_down()
				else:
					collided.interact()
			"Crowbar":
				hasCrowbar = true
				$Player/Head/Camera3D/no_depth_crowbar.show()
				collided.interact()
			"Closet":
				collided.interact()
			_:
				pass
	
	if (Input.is_action_just_pressed("Click")) and collided is Interactable:
		match collided.type:
			"Boards":
				if hasCrowbar:
					$BoardedDoor1.fall_down()
				else:
					collided.interact()


func _on_player_not_pointing_at_interactable():
	CenterMessage.visible = false


func _on_password_lock_success():
	isPasswordLock1Complete = true
	$PasswordLockModel.hide()
	$PasswordLockModel/StaticBody3D.setInactive()
	$PasswordLockModel/StaticBody3D/CollisionShape3D.disabled = true
	$Player/Head/Camera3D.current = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Player.disable_player = false
	$Enemies/skinny_zombie.visible = true
	$Enemies/skinny_zombie.follow = true
	$Enemies/skinny_zombie/CollisionShape3D.disabled = false
	$Dialogue.setDialogue("PRESS [Shift] to RUN!",1,5)


func start_sanity_test():
	$Flashbacks/SanityTest/Camera3D.current = true
	pass


func increment_page_objective():
	foundPages += 1
	Objectives.removeObjective("find_pages")
	Objectives.addObjective("find_pages","Find out the missing diary pages ["+str(foundPages)+"/5]")


func fade_and_exit():
	$Darkness/AnimationPlayer.play("fade_out")
	
func go_to_thankyou_page():
	get_tree().change_scene_to_file.call_deferred("res://src/cutscenes/thank_you/scene.tscn")

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "fade_out"):
		go_to_thankyou_page()
