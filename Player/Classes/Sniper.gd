extends Player

var prevShoot = Vector2.ZERO

func _ready():
	ATT_COOLDOWN = 2
	BULLET_SPEED = 5000

func _physics_process(delta):
	$Line2D.visible = false
	if joystickShootInput != Vector2.ZERO:
		if can_shoot:
			$Line2D.default_color = Color(0, 255, 0)
		else:
			$Line2D.default_color = Color(255, 0, 0)
		$Line2D.visible = true
		var points = []
		var offset = $Firepoint.global_position - global_position
		points.append(offset)
		points.append(offset + joystickShootInput * 1000)
		$Line2D.points = points
		$Line2D.rotation_degrees = -rotation_degrees
	elif prevShoot != Vector2.ZERO:
		joystickShootInput = prevShoot
		_shoot()
		joystickShootInput = Vector2.ZERO
	prevShoot = joystickShootInput

func _on_cooldown_timeout():
	can_shoot = true

func _on_hurtbox_area_entered(area):
	health -= area.damage
	if (health <= 0):
		emit_signal("p_death")
		queue_free()
