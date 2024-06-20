class_name EventArea extends Area3D


@export_multiline var dialogue: String
@export var start_delay: int
@export var end_delay: int
@export var event: int

var disable_area: bool = false

# event code 999 means: DEMO

func _on_body_entered(_body):
	if not disable_area:
		$"../../Dialogue".setDialogue(dialogue, start_delay, end_delay)
		disable_area = true

	if not _body.name == "Player":
		return
	
	match event:
		999:
			print(_body)
			Global.getRoot().fade_and_exit()
		1:
			var zombie = Global.getRoot().get_node('Enemies').get_node('skinny_zombie')
			zombie.following_target = true
		2:
			var player = Global.getRoot().get_node('Player')
			player.flashlight.visible = false 
			player.lock_flashlight = true
			$Timer.start(10)
			$CollisionShape3D.call_deferred("set_disabled",true)


func _on_timer_timeout():
	var player = Global.getRoot().get_node('Player')
	player.lock_flashlight = false
	player.flashlight.visible = true
