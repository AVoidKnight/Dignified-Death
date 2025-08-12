extends PanelContainer

func _ready() -> void:
	if LevelManagement.distance_money == 0:
		hide()
	else: show()
	$MarginContainer/HBoxContainer/distance_money.text = "$" + str(LevelManagement.distance_money)
	$MarginContainer/HBoxContainer/zombie_money.text = "$" + str(LevelManagement.zombie_money)
	await get_tree().create_timer(2).timeout
	while modulate.a > 0:
		modulate.a -= 0.01
		await get_tree().create_timer(0.01).timeout
