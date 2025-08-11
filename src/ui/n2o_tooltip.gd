extends Label

func _ready() -> void:
	var boost_button_array = InputMap.action_get_events("boost")
	text = tr("N2O_TOOLTIP_1") + boost_button_array[0].as_text() + tr("N2O_TOOLTIP_2")
