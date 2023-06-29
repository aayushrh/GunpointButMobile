extends CharacterBody2D

class_name Player

signal p_death

@export var FRICTION = 0.9
@export var ACCELERATION = 3000
@export var MAX_SPEED = 2000
@export var MAX_HEALTH = 5
@export var ATT_COOLDOWN = 1
@export var BULLET_SPEED = 5000

@onready var Bullet = preload("res://Player/PBullet.tscn")

var health = MAX_HEALTH

var joystickMoveInput = Vector2.ZERO
var joystickShootInput = Vector2.ZERO
var lastShootInput = Vector2.ZERO

var can_shoot = true

func _process(delta):
	if (Input.is_action_just_pressed("Pause")):
		Global.pause = !Global.pause
	if (!Global.pause):
		_move(delta)
		rotation_degrees = atan2(lastShootInput.y, lastShootInput.x)*180/PI + 90
		if joystickShootInput != Vector2.ZERO:
			lastShootInput = joystickShootInput

func _move(delta):
	var input_vector = joystickMoveInput
	
	velocity += input_vector * ACCELERATION * delta
	velocity = clampV(velocity, MAX_SPEED)
	
	velocity *= FRICTION
	
	move_and_slide()

func _shoot():
	if (joystickShootInput != Vector2.ZERO) and can_shoot:
		can_shoot = false
		var bullet = Bullet.instantiate()
		bullet.speed = BULLET_SPEED
		bullet.global_position = $Firepoint.global_position
		bullet.velocity = joystickShootInput
		get_tree().current_scene.add_child(bullet)
		$Cooldown.start(ATT_COOLDOWN)

func rotate_to(degree):
	var tween = create_tween()
	tween.tween_property(self, "rotation_degrees", degree, 0.1)

func clampV(vector, max):
	if(pow(pow(vector.x, 2) + pow(vector.y, 2), 0.5) > max):
		return (vector.normalized() * max)
	return(vector)
