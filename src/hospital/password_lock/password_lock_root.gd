extends Node3D
signal passwordSuccess

func emitSignal():
	passwordSuccess.emit()
