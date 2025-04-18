extends CharacterBody2D

# Constants
const SPEED = 200
const GRAVITY = 600
const JUMP_FORCE = -400

func _physics_process(delta):
	# Apply gravity
	velocity.y += GRAVITY * delta

	# Handle left/right input
	var input_direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = input_direction * SPEED

	# Jump
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_FORCE

	# Move the character
	move_and_slide()
