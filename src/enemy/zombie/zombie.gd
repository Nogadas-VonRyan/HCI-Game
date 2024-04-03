extends Node3D

@export var animation: String
var animation_node: AnimationPlayer

func _ready():
	match animation:
		"Sleep":
			animation_node = $AnimationPlayer
		"Run":
			animation_node = $AnimationPlayer2

func _process(_delta):
	animation_node.play("Armature|mixamocom|Layer0")
