extends Node3D
signal passwordSuccess


func _on_password_success():
	passwordSuccess.emit()
