extends CharacterBody3D

@onready var nav = $NavigationAgent3D
@export var animation: String
@export var follow: bool = true

var animation_node: AnimationPlayer

func _ready():
	match animation:
		"Sleep":
			animation_node = $AnimationPlayer
		"Run":
			animation_node = $AnimationPlayer2

func _physics_process(delta):
	animation_node.play("Armature|mixamocom|Layer0")
	if not follow:
		return
	
	var dir = Vector3()
	nav.target_position = $"../../Player".global_position
	
	var next_pos = nav.get_next_path_position()
	if position != next_pos:
		look_at(next_pos)
	dir = next_pos - global_position
	dir = dir.normalized()
	
	velocity = velocity.lerp(dir * 3, delta * 10)
	move_and_slide()
