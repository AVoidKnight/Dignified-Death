extends Node2D

func _ready() -> void:
	Utils.game = self
	$basic_ui/basic_ui/FuelMargin/FuelProgressbar.hide()
	$base_car.is_movable = false
	if PlayerManagement.is_first_launch:
		$upgrade_ui/upgrade_ui._on_start_button_pressed()


func _on_button_pressed() -> void:
	print("fuel_upgrade_pressed")
