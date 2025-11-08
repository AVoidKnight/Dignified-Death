extends Control
var mouse_counter : int = 0;
func _ready() -> void:
	if $"../..".name == "game":
		$PauseMargin/TextureButton.show()
	if PlayerManagement.auto == true:
		update_n2o_auto_icon(PlayerManagement.n2o, true)
		$BoostMargin/BoostProgressbar.hide()
	if PlayerManagement.n2o == 0:
		$BoostMargin/BoostProgressbar.hide()
	PlayerManagement.money_changed.connect(update_money_label)
	update_money_label()
	match WindowManagement.current_corner:
		WindowManagement.BOTTOM_LEFT:
			get_tree().get_first_node_in_group("pause_button").size_flags_horizontal = 0
			get_tree().get_first_node_in_group("auto_end_button").size_flags_horizontal = 8
		WindowManagement.BOTTOM_RIGHT:
			get_tree().get_first_node_in_group("pause_button").size_flags_horizontal = 8
			get_tree().get_first_node_in_group("auto_end_button").size_flags_horizontal = 0
	if !PlayerManagement.is_first_launch:
		$PauseMargin/PanelContainer.queue_free()


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


func _on_auto_end_button_pressed() -> void:
	PlayerManagement.auto = false
	Utils.player.get_node("FuelComponent")._on_timer_timeout()


func update_n2o_auto_icon(run_counter: int = 4, is_first_time: bool = false) -> void:
	for i in range(1, run_counter+1):
		print("BoostMargin/HBoxContainer/TextureRect" + str(i))
		get_node("BoostMargin/HBoxContainer/TextureRect" + str(i)).show()
	if is_first_time == true:
		return
	get_node("BoostMargin/HBoxContainer/TextureRect" + str(run_counter + 1)).hide()


func update_pos(pos: float) -> void:
	$FuelMargin/Label.text = str(floori(pos));


func _on_mouse_entered() -> void:
	pass


func _on_mouse_exited() -> void:
	pass
