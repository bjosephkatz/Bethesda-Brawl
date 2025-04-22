extends CharacterBody2D

const SPEED = 500
const GRAVITY = 1500
const JUMP_FORCE = -800
const ATTACK_DURATION = 0.2  # seconds
const DAMAGE = 10

var max_health: int = 100
var health: int = max_health

@onready var attack_area = $AttackArea
@onready var health_bar = $HealthBar  # Adjust path if needed

var is_attacking = false
var attack_timer = 0.0

func _physics_process(delta):
	velocity.y += GRAVITY * delta

	var input_direction = Input.get_action_strength("move_right_p1") - Input.get_action_strength("move_left_p1")
	velocity.x = input_direction * SPEED

	if is_on_floor() and Input.is_action_just_pressed("jump_p1"):
		velocity.y = JUMP_FORCE

	if Input.is_action_just_pressed("attack_p1") and not is_attacking:
		perform_attack()

	if is_attacking:
		attack_timer -= delta
		if attack_timer <= 0.0:
			end_attack()

	move_and_slide()

func perform_attack():
	is_attacking = true
	attack_timer = ATTACK_DURATION
	attack_area.monitoring = true

func end_attack():
	is_attacking = false
	attack_area.monitoring = false

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("players") and body != self:
		print("Hit: ", body.name)
		if body.has_method("take_damage"):
			body.take_damage(DAMAGE)

func take_damage(amount: int) -> void:
	health -= amount
	health = clamp(health, 0, max_health)
	print(name, " took ", amount, " damage. Health now: ", health)
	update_health_bar()

func update_health_bar() -> void:
	if health_bar and health_bar.has_method("set_health"):
		health_bar.set_health(health)
