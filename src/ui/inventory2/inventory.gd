extends Control


@onready var DiaryPageContainer := $InventoryPanel/DiaryPages/ScrollContainer/VBoxContainer

var ItemInventory: Array[String] = []
var DiaryPageInventory: Array[Interactable] = []


func _ready():
	$Selector.visible = false
	addDiaryPageWithoutObject(99,"
		Hello, my grandson.\n\nIf you're reading this, then I must have been long gone from this world already.
		
		I have a lot to tell you but I'm afraid I don't have much time left before it happens.
		You have to go back to where I used to work. 
		There, you will find all the answers. I hope. 
		Thank you for everything, Paul. 
		I'll miss you. 
		
		Grandpa Minalabag
		04311")


func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_cancel") and not $"../PauseMenu".visible:
		closeInventory()
	
	
func closeInventory():
	if $DiaryPanel.visible == true:
		$DiaryPanel.hide()
		$InventoryPanel.show()
		$DiaryModel.show()
	else: 
		hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		$"..".stopTransition = true
		get_tree().paused = false


func labelDesigner(label):
	label.mouse_filter = Control.MOUSE_FILTER_STOP
	label.custom_minimum_size = Vector2(0,100)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


func openDiaryPanel(contents: String):
	$DiaryPanel/Label.text = contents
	$DiaryPanel.show()
	$InventoryPanel.hide()
	$DiaryModel.hide()


func closeDiaryPanel():
	pass


func addDiaryPage(diaryObject: Interactable):
	DiaryPageInventory.append(diaryObject)
	
	var newDiaryLabel = DiaryLabel.new()
	newDiaryLabel.page_content = diaryObject.page_content
	newDiaryLabel.text = "Diary Page #" + str(diaryObject.page_number)
	newDiaryLabel.connect("gui_input",Callable(newDiaryLabel.display).bind($Selector))
	labelDesigner(newDiaryLabel)
	
	if DiaryPageContainer.get_child_count() == 0:
		DiaryPageContainer.add_child(HSeparator.new())

	DiaryPageContainer.add_child(newDiaryLabel)
	DiaryPageContainer.add_child(HSeparator.new())


func addDiaryPageWithoutObject(page_number: int, page_content: String):
	var newDiaryLabel = DiaryLabel.new()
	newDiaryLabel.page_content = page_content
	newDiaryLabel.text = "Diary Page #" + str(page_number)
	newDiaryLabel.connect("gui_input",Callable(newDiaryLabel.display).bind($Selector))
	labelDesigner(newDiaryLabel)
	
	if DiaryPageContainer.get_child_count() == 0:
		DiaryPageContainer.add_child(HSeparator.new())
	
	DiaryPageContainer.add_child(newDiaryLabel)
	DiaryPageContainer.add_child(HSeparator.new())


var next
var prev
var rotating := false
var sensitivity := .005

@onready var diary_model = $DiaryModel/SubViewport/crimson_ledger

func _on_sub_viewport_container_gui_input(_event):
	if Input.is_action_just_pressed("Click"):
		rotating = true
		prev = get_viewport().get_mouse_position()

	if Input.is_action_just_released("Click"):
		rotating = false
	
	if rotating:
		next = get_viewport().get_mouse_position()
		diary_model.rotation.y += (next.x - prev.x) * sensitivity
		diary_model.rotation.z += (next.y - prev.y) * sensitivity
		prev = next


func _on_main_inventory_gui_input(_event):
	$Selector.visible = false
