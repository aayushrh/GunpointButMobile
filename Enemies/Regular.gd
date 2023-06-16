extends KinematicBody2D

enum {
	CHASE,
	ATTACK
}

var state = CHASE

func _on_Hurtbox_body_entered(body):
	body.queue_free()
	queue_free()
