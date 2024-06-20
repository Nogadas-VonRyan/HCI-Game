extends CharacterBody3D

@onready var nav = $NavigationAgent3D
@export var animation: String
@export var follow: bool = false
@onready var animationNode = $AnimationPlayer
@onready var camera = $Camera3D
@onready var scream = $scream
@export var disabled_collision = false

@onready var spawn_position = Vector3(-52.459,11.123,31.654)

@onready var player_position = Global.getRoot().get_node('Player')
var target
var following_target: bool = false

var animation_node: String

func _ready():
	target = spawn_position
	$CollisionShape3D.disabled = disabled_collision
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
	
	if following_target:
		nav.target_position = target
	else:
		nav.target_position = player_position.global_position
		
	if name == "skinny_zombie":
		print(following_target)
	
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
		
		
		var zombie = $"../skinny_zombie"
		zombie.global_position.x = -28.89
		zombie.global_position.y = 11.26
		zombie.global_position.z = 21.15
		zombie.follow_player()
		
		camera.current = false
		
	
func follow_target(input_position):
	following_target = true
	target = input_position

func follow_player():
	following_target = false
