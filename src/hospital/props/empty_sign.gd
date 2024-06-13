extends Node3D


@onready var label = $Label3D
@export var text: String

func _ready():
	label.text = text
