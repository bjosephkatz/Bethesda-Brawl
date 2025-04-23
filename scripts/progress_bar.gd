extends ProgressBar

@export var max_health: int = 100

func _ready():
	min_value = 0
	max_value = max_health
	value = max_health
	print("Health bar initialized. Max:", max_health)

func set_health(current_health: int) -> void:
	value = clamp(current_health, min_value, max_value)
	print(current_health)
