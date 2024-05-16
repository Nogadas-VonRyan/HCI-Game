extends Control

var ObjectivesList: Array[String]
@onready var ObjectivesContainer = $Container/VBoxContainer

func _ready():
	# addObjective("look_around","Look around and explore")
	pass

func addObjective(name: String, text: String):
	if ObjectivesList.find(name) != -1:
		return
	
	ObjectivesList.append(name)
	var label := Label.new()
	label.name = name
	label.text = "- " + text
	ObjectivesContainer.add_child(label)


func removeObjective(name: String):
	if not ObjectivesContainer.has_node(name):
		return
	var label: Node = ObjectivesContainer.get_node(name)
	ObjectivesContainer.remove_child(label)
	label.queue_free()
	ObjectivesList.erase(name)
