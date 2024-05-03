class_name DiaryLabel extends Label

var page_number: int
var page_content: String

func display(_name,Selector):
	Selector.position.y = global_position.y
	Selector.visible = true
	
	if Input.is_action_just_pressed("Click"):
		# refactor this ugly shit
		Selector.visible = false
		$"../../../../..".openDiaryPanel(page_content)
