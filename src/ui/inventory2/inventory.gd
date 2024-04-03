extends Control


#@onready var ItemContainer = $InventoryPanel/HBoxContainer/CenterContainer/Items
@onready var DiaryPageContainer = $InventoryPanel/DiaryPages/ScrollContainer/VBoxContainer

var ItemInventory: Array[String] = []
var DiaryPageInventory: Array[Interactable] = []

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
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

func openDiaryPanel(contents: String):
	$DiaryPanel/Label.text = contents
	$DiaryPanel.show()
	$InventoryPanel.hide()
	$DiaryModel.hide()


func closeDiaryPanel():
	pass


func addDiaryPage(diaryObject: Interactable):
	#adding to array of references
	DiaryPageInventory.append(diaryObject)
	
	#adding to container
	var newDiaryLabel = DiaryLabel.new()
	newDiaryLabel.mouse_filter = Control.MOUSE_FILTER_STOP
	newDiaryLabel.custom_minimum_size = Vector2(0,100)
	newDiaryLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	newDiaryLabel.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	newDiaryLabel.page_content = diaryObject.page_content
	newDiaryLabel.connect("gui_input",newDiaryLabel.display)
	newDiaryLabel.text = "Diary Page #" + str(diaryObject.page_number)
	newDiaryLabel.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	if DiaryPageInventory.size() == 1:
		DiaryPageContainer.add_child(HSeparator.new())
		pass
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
