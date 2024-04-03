extends Control


@onready var Dialogue = $Label
@onready var timer = $Timer

func setDialogue(newDialogue: String, delay: int):
	if timer.time_left > 0:
		return
	Dialogue.text = newDialogue
	timer.start(delay)

func clearDialogue():
	Dialogue.text = ""

func _on_timer_timeout():
	clearDialogue()
	
