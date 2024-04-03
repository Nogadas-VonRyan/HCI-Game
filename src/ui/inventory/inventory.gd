extends ColorRect

@onready var slots: Array[Node] = $SlotList.get_children()
@onready var icon = load("res://icon.svg")
@onready var shamma = load("res://assets/images/member_photos/BERGADO_DIT.jpeg")
@onready var paul = load("res://assets/images/member_photos/Reyes_P_DIT.jpeg")
@onready var norona = load("res://assets/images/member_photos/NOROÑA_DIT.jpeg")
var p_i = 0

#func _ready():
#	clearSlots()
#	pass
#
#func _unhandled_input(_event):
#	if Input.is_action_just_pressed("enter"):
#		addItemToSlot()
#
#func clearSlots():
#	for i in slots:
#		getTextureRect(i).texture = null
#
#func addItemToSlot():
#	for i in slots:
#		if getTextureRect(i).texture:
#			continue
#		match p_i:
#			0:
#				getTextureRect(i).texture = paul
#			1:
#				getTextureRect(i).texture = shamma
#			2:
#				getTextureRect(i).texture = norona
#			_:
#				getTextureRect(i).texture = icon
#		p_i += 1
#		break
#
#func getTextureRect(node):
#	return node.get_child(0).get_child(0).get_child(0)
