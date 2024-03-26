extends Node3D


@onready var rootNode = $"../../.."
@onready var allSlots: Array[Node] = [
	$ClockFace1_3,
	$ClockFace2_4,
	$ClockFace3_5,
	$ClockFace4_6,
	$ClockFace5_2
]
@onready var slot: Node = allSlots[0]
@export var password: Array[int] = [1,2,3,4,5]
@export var rotationSpeed: float = 0.08

const rotationDistance: float = PI / 10 * 2
var slotValues: Array[int] = [0,0,0,0,0]
var currentSlot: int = 0
var isRotating: bool = false
var nextRotation: float = 0.0

func _process(delta):	
	if slot.get_child(0).rotation.z <= nextRotation:
		slot.get_child(0).rotation.z = nextRotation
		slot.get_child(1).rotation.z = nextRotation
		isRotating = false

	if not isRotating:
		return	
	slot.get_child(0).rotation.z -= rotationSpeed
	slot.get_child(1).rotation.z -= rotationSpeed


func rotateSlot(slot_num: int):
	if Input.is_action_just_pressed("Click") and not isRotating:
		currentSlot = slot_num
		slot = allSlots[currentSlot]
		nextRotation = slot.get_child(0).rotation.z - rotationDistance
		isRotating = true
		slotValues[currentSlot] += 1
		slotValues[currentSlot] %= 10

		if checkAgainstPassword():
			rootNode.emitSignal()

func checkAgainstPassword() -> bool:
	for i in range(5):
		if slotValues[i] != password[i]:
			return false
		i += 1
	return true

func _on_slot1_input(_camera, event, _position, _normal, _shape_idx):
	rotateSlot(0)

func _on_slot2_input(_camera, event, _position, _normal, _shape_idx):
	rotateSlot(1)

func _on_slot3_input(_camera, event, _position, _normal, _shape_idx):
	rotateSlot(2)

func _on_slot4_input(_camera, event, _position, _normal, _shape_idx):
	rotateSlot(3)

func _on_slot5_input(_camera, event, _position, _normal, _shape_idx):
	rotateSlot(4)
