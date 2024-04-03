extends Node3D

@onready var Cam = $Camera3D
@onready var Blink = $Blink
@onready var EnemySpawner = $EnemySpawner
var prev_animation: String = ""

func _ready():
	$Camera3D/AnimationPlayer.play("turn_left")


func _process(_delta):
	if $Camera3D/AnimationPlayer.is_playing():
		return
	
	if Input.is_action_just_pressed("moveLeft") and not prev_animation == "left":
		$Camera3D/AnimationPlayer.play("turn_left")
		prev_animation = "left"
	if Input.is_action_just_pressed("moveRight") and not prev_animation == "right":
		$Camera3D/AnimationPlayer.play("turn_right")
		prev_animation = "right"
	if Input.is_action_just_pressed("space"):
		$Camera3D/AnimationPlayer.play("blink")
		pass
	
	pass

func turn_left():
	Cam.rotation.y -= 7.8
	pass
	
func turn_right():
	Cam.rotation.y += 7.8
	pass



func _on_animation_player_animation_finished(anim_name):
	if anim_name != "blink":
		return
	EnemySpawner.get_node("Sprite3D").hide() 
