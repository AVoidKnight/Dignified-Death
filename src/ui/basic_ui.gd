extends Control


func _on_texture_button_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			$SettingsMargin.show()
			get_tree().paused = true
		false:
			$SettingsMargin.hide()
			get_tree().paused = false
