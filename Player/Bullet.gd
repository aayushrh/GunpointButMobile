extends KinematicBody2D

var direction = Vector2.ZERO

export (int) var speed = 50000

func _process(delta):
	move_and_slide(direction * speed * delta)
