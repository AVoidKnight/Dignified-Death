extends HSlider
func _ready():
	value = SettingsManagement.volume * 100

func _on_drag_ended(value_changed: bool) -> void:
	if value_changed:
		SettingsManagement.volume_setting(value / 100)
		print(value)
		var zombie_sans = randi_range(1,3)
		match zombie_sans:
			1:
				AudioManagement.play("res://assets/sounds/zombie-sound.mp3",0.0, 1.23)
			2:
				AudioManagement.play("res://assets/sounds/zombie-sound.mp3",1.68, 2.55)
			3:
				AudioManagement.play("res://assets/sounds/zombie-sound.mp3",3.0, 4.05)
