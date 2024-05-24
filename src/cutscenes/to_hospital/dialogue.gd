extends Control

@onready var timer = $Timer
@onready var label = $DialogueBox/Label

const dialogues = [
	"I followed a small map drawn in a parchment just at the front page of the diary",
	"Along the way, I realized that a lot of pages were either forcefully ripped out or cut off",
	"What is grandpa even hiding?",
	"In the end of my musings, I managed to finally reach grandfather's workplace, Havenwood Hospital"
]
const dialogue_timestamp = [94,87,84,76]

func _ready():
	timer.start(103)

func _input(_event):
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file("res://src/hospital/scene.tscn")


func _process(delta):
	if round(timer.time_left) == 101:
		label.text = dialogues[0]
		$AudioStreamPlayer.play()
	
	if round(timer.time_left) == 94:
		label.text = dialogues[1]
	if round(timer.time_left) == 87:
		label.text = dialogues[2]
	if round(timer.time_left) == 84:
		label.text = dialogues[3]		
	if round(timer.time_left) == 76:
		get_tree().change_scene_to_file.call_deferred("res://src/hospital/scene.tscn")

