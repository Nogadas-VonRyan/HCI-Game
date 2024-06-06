extends CharacterBody3D

@onready var nav = $NavigationAgent3D
@export var animation: String
@export var follow: bool = true

var animation_node: String

func _ready():
	match animation:
		"Sleep":
			animation_node = "Armature|mixamocom|Layer0"
		"Walk":
			animation_node = "Armature001|mixamocom|Layer0"

func _physics_process(delta):
	$AnimationPlayer.play(animation_node)
	if not follow:
		return
	
	var dir = Vector3()
	nav.target_position = $"../../Player".global_position
	
	var next_pos = nav.get_next_path_position()
	if position != next_pos:
		look_at(next_pos)
	dir = next_pos - global_position
	dir = dir.normalized()
	
	velocity = velocity.lerp(dir * 0.7, delta * 10)
	move_and_slide()
