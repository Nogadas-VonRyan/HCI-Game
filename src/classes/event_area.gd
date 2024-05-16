class_name EventArea extends Area3D


@export_multiline var dialogue: String
@export var start_delay: int
@export var end_delay: int
@export var event: int
var disable_area: bool = false


func _on_body_entered(_body):
	if not disable_area:
		$"../../Dialogue".setDialogue(dialogue, start_delay, end_delay)
		disable_area = true

	if _body.name == "Player" and event == 10:
		print(_body)
		Global.getRoot().fade_and_exit()
