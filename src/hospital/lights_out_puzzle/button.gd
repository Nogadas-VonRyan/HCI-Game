extends StaticBody3D


@onready var meshNode = $MeshInstance3D
@export var row = 0
@export var col = 0
enum { CENTER, UP, RIGHT, LEFT, DOWN }

func _ready():
	meshNode.mesh = MeshInstance3D.new()
	meshNode.mesh = CapsuleMesh.new()

	meshNode.mesh.material = StandardMaterial3D.new()
	meshNode.mesh.material.albedo_color = Color(1,0,0)
	
	meshNode.mesh.material.emission_enabled = true
	meshNode.mesh.material.emission = Color(1,0,0) 


func _physics_process(delta):
	# this is needed because of emission's unique feature of exiting the function early
	if meshNode.mesh.material.emission != meshNode.mesh.material.albedo_color:
		meshNode.mesh.material.emission = meshNode.mesh.material.albedo_color 


func _on_input_event(_camera, _event, _position, _normal, _shape_idx):
	if Input.is_action_just_pressed("Click"):
		setButton(row,col,CENTER)
		setButton(row,col,UP)
		setButton(row,col,RIGHT)
		setButton(row,col,LEFT)
		setButton(row,col,DOWN)
		
		isPuzzleComplete()


func setButton(i,j,pos):
	match pos:
		UP:
			i -= 1
		RIGHT:
			j -= 1
		LEFT:
			j += 1
		DOWN:
			i += 1

	if i < 0 or i > 4 or j < 0 or j > 4: #check for boundaries 
		return
	
	var material = $"..".get_child(i*5+j).meshNode.mesh.material
	if material.albedo_color == Color(1,0,0):
		material.albedo_color = Color(0,1,0)
	else:
		material.albedo_color = Color(1,0,0)


func isPuzzleComplete():
	var buttons = $"..".get_children()
	for button in buttons:
		if button.meshNode.mesh.material.albedo_color == Color(1,0,0):
			return
	var key = Global.getRoot().get_node('Props').get_node('underground_key')
	key.show()
	key.get_node('StaticBody3D').get_node('CollisionShape3D').disabled = false
	print("success")
