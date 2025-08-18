extends Node2D

func _ready() -> void:
	Utils.game = self
	$basic_ui/basic_ui/FuelMargin/FuelProgressbar.hide()
	$base_car.is_movable = false


func _on_button_pressed() -> void:
	print("fuel_upgrade_pressed")
