extends Node2D

var player = null

func _process(delta):
	if player == null:
		for i in get_children():
			if i is Player:
				player = i
	player.joystickMoveInput = $Controls.move_input
	player.joystickShootInput = $Controls.shoot_input
