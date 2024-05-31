extends Control

@onready var animation = $Background/AnimationPlayer
@onready var timer = $Timer
var displayed_count: int = 0

func _ready():
	# animation.play("text_fade")
	timer.start(51)

func _input(event):
	if event is InputEventKey:
		get_tree().change_scene_to_file.call_deferred("res://src/menu/scene.tscn")



func _on_animation_player_animation_finished(anim_name):
#	if displayed_count == 1:
	get_tree().change_scene_to_file.call_deferred("res://src/menu/scene.tscn")
#	$Background/Texts/Title.text = ""
#	$Background/Texts/Subtitle.text = "Placeholder title"
#	animation.play("text_fade")
#	displayed_count += 1
	pass


func _on_timer_timeout():
	get_tree().change_scene_to_file.call_deferred("res://src/menu/scene.tscn")
