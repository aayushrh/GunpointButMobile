extends Node2D

func _process(delta):
	$Player.joystickMoveInput = $CanvasLayer.move_input
	$Player.joystickShootInput = $CanvasLayer.shoot_input
