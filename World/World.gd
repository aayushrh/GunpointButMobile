extends Node2D
func _process(delta):
	if(!Global.keyboard):
		$Player.joystickMoveInput = $Controls.move_input
		$Player.joystickShootInput = $Controls.shoot_input
