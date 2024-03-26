extends Node2D

@onready var animation = $Background/AnimationPlayer
var displayed_count: int = 0

func _ready():
	animation.play("text_fade")


func _on_animation_player_animation_finished(anim_name):
	if displayed_count == 1:
		get_tree().change_scene_to_file("res://src/menu/scene.tscn")
	$Background/Texts/Title.text = ""
	$Background/Texts/Subtitle.text = "Placeholder title"
	animation.play("text_fade")
	displayed_count += 1
