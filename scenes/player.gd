extends CharacterBody2D

const SPEED = 200
const JUMP_VELOCITY = -500
const GRAVITY = 1000

func _physics_process(delta):
	var velocity = self.velocity

	# Horizontal movement
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x *= SPEED

	# Gravity
	velocity.y += GRAVITY * delta

	# Jump
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	self.velocity = velocity
	move_and_slide()
