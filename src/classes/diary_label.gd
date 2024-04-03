class_name DiaryLabel extends Label

var page_number: int
var page_content: String

func display(_event):
	if Input.is_action_just_pressed("Click"):
		# refactor this ugly shit
		$"../../../../..".openDiaryPanel(page_content)
