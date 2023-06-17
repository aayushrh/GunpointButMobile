extends CanvasLayer

var move_input = Vector2.ZERO
var shoot_input = Vector2.ZERO

var buttonRad = 125

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $Movement.is_pressed():
			move_input = (event.position-$Movement.position-Vector2(buttonRad,buttonRad)).normalized()
		else:
			move_input = Vector2.ZERO
		
		if $Shooting.is_pressed():
			shoot_input = (event.position-$Shooting.position-Vector2(buttonRad,buttonRad)).normalized()
		else:
			shoot_input = Vector2.ZERO
