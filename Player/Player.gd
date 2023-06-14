extends KinematicBody2D

export(int) var ACCELERATION = 500
export(int) var MAX_SPEED = 500
export(float) var FRICTION = 0.9

var joystickMoveInput = Vector2.ZERO
var joystickShootInput = Vector2.ZERO
var velocity = Vector2.ZERO

func _process(delta):
	var input_vector = joystickMoveInput
	
	velocity += input_vector * ACCELERATION * delta
	velocity = clampV(velocity, MAX_SPEED)
	
	velocity *= FRICTION
	
	velocity = move_and_slide(velocity)

func clampV(vector, maxi):
	if(pow(pow(vector.x, 2) + pow(vector.y, 2), 0.5) > maxi):
		return (vector.normalized() * maxi)
	return(vector)
