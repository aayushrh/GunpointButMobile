extends AnimatableBody2D

var velocity = Vector2.ZERO

@export var speed = 5000

func _process(delta):
	if (!Global.pause):
		move_and_collide(velocity * speed * delta)
