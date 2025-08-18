extends Control

func _ready() -> void:
		$BoostMargin/BoostProgressbar.hide()
	PlayerManagement.money_changed.connect(update_money_label)
	update_money_label()
	match WindowManagement.current_corner:
		WindowManagement.BOTTOM_LEFT:
			get_tree().get_first_node_in_group("pause_button").size_flags_horizontal = 0
		WindowManagement.BOTTOM_RIGHT:
			get_tree().get_first_node_in_group("pause_button").size_flags_horizontal = 8


func _on_texture_button_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			$SettingsMargin.show()
			get_tree().paused = true
		false:
			$SettingsMargin.hide()
			get_tree().paused = false


func update_money_label():
	$PauseMargin/VBoxContainer/PanelContainer/Label.text = "$" + str(PlayerManagement.money)
