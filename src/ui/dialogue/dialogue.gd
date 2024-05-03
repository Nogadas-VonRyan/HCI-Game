extends Control


@onready var Dialogue = $Label
@onready var start_timer = $StartTimer
@onready var end_timer = $EndTimer
@onready var textDialogue: String

func setDialogue(newDialogue: String,start_delay: int, end_delay: int):
	if floor(start_timer.time_left) > 0 || floor(end_timer.time_left) > 0:
		return
	textDialogue = newDialogue
	start_timer.start(start_delay)
	end_timer.start(start_delay + end_delay)

func clearDialogue():
	Dialogue.text = ""
	textDialogue = ""

func _on_start_timer_timeout():
	Dialogue.text = textDialogue

func _on_end_timer_timeout():
	clearDialogue()
