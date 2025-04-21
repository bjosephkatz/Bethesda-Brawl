extends ProgressBar
func _ready():
	var bar = $HealthBar
	bar.min_value = 0
	bar.max_value = 100
	bar.value = 50

	print("min:", bar.min_value)
	print("max:", bar.max_value)
	print("value:", bar.value)
