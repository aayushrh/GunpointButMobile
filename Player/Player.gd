extends CharacterBody2D

@export var FRICTION = 0.9
@export var ACCELERATION = 3000
@export var MAX_SPEED = 2000

var joystickMoveInput = Vector2.ZERO
var joystickShootInput = Vector2.ZERO

func _process(delta):
	var input_vector = joystickMoveInput
	
	velocity += input_vector * ACCELERATION * delta
	velocity = clampV(velocity, MAX_SPEED)
	
	velocity *= FRICTION
	
	move_and_slide()

func clampV(vector, max):
	if(pow(pow(vector.x, 2) + pow(vector.y, 2), 0.5) > max):
		return (vector.normalized() * max)
	return(vector)
