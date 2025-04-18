extends CharacterBody2D

const SPEED = 200
const GRAVITY = 600
const JUMP_FORCE = -400

func _physics_process(delta):
	# Apply gravity
	velocity.y += GRAVITY * delta

	# Handle left/right movement (A/D)
	var input_direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = input_direction * SPEED

	# Jump (W)
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_FORCE

	move_and_slide()
