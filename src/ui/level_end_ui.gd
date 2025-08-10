extends CanvasLayer

func _on_texture_button_pressed() -> void:
	Utils.get_tree().change_scene_to_file("res://src/level_parts/upgrade_level.tscn")


func _on_distance_label_ready() -> void:
	$CenterContainer/PanelContainer/MarginContainer/VBoxContainer/distance_label.text = tr("DISTANCE_MONEY") + ": \n" + str(LevelManagement.distance_money)
	$CenterContainer/PanelContainer/MarginContainer/VBoxContainer/zombie_label.text = tr("ZOMBIE_MONEY") + ": \n" + str(LevelManagement.zombie_money)
