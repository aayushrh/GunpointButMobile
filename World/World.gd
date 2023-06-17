extends Node2D
func _process(delta):
	$Player.joystickMoveInput = $Controls.move_input
	$Player.joystickShootInput = $Controls.shoot_input
