extends Label

func _ready() -> void:
	var boost_button_array_1 = InputMap.action_get_events("accelerate")
	var boost_button_array_2 = InputMap.action_get_events("clickthrough_window")
	var use : String = tr("N2O_TOOLTIP_1")
	text = use + boost_button_array_1[0].as_text() + tr("TUTORIAL_TOOLTIP_1") + use + boost_button_array_2[0].as_text() + tr("TUTORIAL_TOOLTIP_2")
	await get_tree().create_timer(8).timeout
	while get_parent().get_parent().modulate.a > 0:
		get_parent().get_parent().modulate.a -= 0.02
		await get_tree().create_timer(0.02).timeout
	get_parent().get_parent().queue_free()
