extends Player

func _ready():
	ATT_COOLDOWN = 0.2
	BULLET_SPEED = 1000

func _physics_process(delta):
	_shoot()

func _on_cooldown_timeout():
	can_shoot = true

func _on_hurtbox_area_entered(area):
	health -= area.damage
	if (health <= 0):
		emit_signal("p_death")
		queue_free()
