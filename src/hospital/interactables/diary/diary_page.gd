extends Interactable


@export var page_number: int
@export_multiline var page_content: String

@export_multiline var dialogue_line: String
@export var delay: int
var disable_dialogue: bool = false

func _ready():
	type = "DiaryPage"
	message = "Press [E] to Take"


func interact():
	visible = false
	message = ""
	$"../../Dialogue".setDialogue(dialogue_line,delay)
