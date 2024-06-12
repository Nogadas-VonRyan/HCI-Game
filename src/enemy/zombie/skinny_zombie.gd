extends CharacterBody3D

@onready var nav = $NavigationAgent3D
@export var animation: String
@export var follow: bool = true
@onready var animationNode = $AnimationPlayer
@onready var camera = $Camera3D
@onready var scream = $scream

var animation_node: String

func _ready():
	match animation:
		"Sleep":
			animation_node = "Armature|mixamocom|Layer0"
		"Walk":
			animation_node = "Armature001|mixamocom|Layer0"
	animationNode.play(animation_node)

func _physics_process(delta):
	if not follow:
		return
		
	if animationNode.current_animation != 'Armature002|mixamocom|Layer0001':
		animationNode.play("Armature001|mixamocom|Layer0")
		
	var dir = Vector3()
	nav.target_position = $"../../Player".global_position
	
	var next_pos = nav.get_next_path_position()
	if position != next_pos:
		look_at(next_pos)
	dir = next_pos - global_position
	dir = dir.normalized()
	
	velocity = velocity.lerp(dir * 0.7, delta * 10)
	move_and_slide()

func _on_area_3d_body_entered(body):
	if body.name != 'Player' or follow == false:
		return
	
	animationNode.play('Armature002|mixamocom|Layer0001')
	Global.getRoot().get_node('Darkness').get_node('AnimationPlayer').play('fade_in_instant')
	
	camera.current = true
	scream.play()

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == 'Armature002|mixamocom|Layer0001'):
		var Player = Global.getRoot().get_node('Player')
		Player.global_position.x = -52.041
		Player.global_position.y = 11.304
		Player.global_position.z = 32.31
		camera.current = false
	pass
