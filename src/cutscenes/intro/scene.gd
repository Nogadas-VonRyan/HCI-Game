extends Node3D


@onready var timer: Timer = $Timer
@onready var dialogue: Label = $DialogueBox/Label

var dialogue_lines: Array[String] = [
	"When I was a kid,",
	"my grandfather told me of how great of a doctor he was",
	"He had received many accolades and medals for his achievements.",
	"Everyone was talking about him",
	"He was renowned",
	"But...",
	"I have a feeling that something was off..."
]
var dialogue_stamps: Array[int] = [100, 98, 94, 89, 87, 85, 84]
var current_dialogue: int = 0

func _ready():
	dialogue_lines[0]
	timer.start(100)


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if Input.is_action_just_pressed("ui_accept"):
		print(timer.time_left)
	pass


func _process(delta):
	if timer.time_left <= 99.5:
		$WorldEnvironment.environment.background_color = Color(0,0,0)
	print(timer.time_left)
	if timer.time_left < 80:
		get_tree().change_scene_to_file("res://src/house/scene.tscn")
	
	if dialogue_stamps.size() > current_dialogue and dialogue_stamps[current_dialogue] == round(timer.time_left):
		dialogue.text = dialogue_lines[current_dialogue] as String
		current_dialogue += 1
	pass
