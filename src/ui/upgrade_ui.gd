extends Control
@onready var upgrade_panel: PanelContainer = $MarginContainer/upgrade_panel
var auto_button : bool = false

func _ready() -> void:
	update_progressbars()
	WindowManagement.corner_changed.connect(_on_corner_changed)
	_on_corner_changed()


func _on_corner_changed():
	match WindowManagement.current_corner:
		WindowManagement.BOTTOM_LEFT:
			get_tree().get_first_node_in_group("panel_with_play_button").size_flags_horizontal = 8
		WindowManagement.BOTTOM_RIGHT:
			get_tree().get_first_node_in_group("panel_with_play_button").size_flags_horizontal = 0


func _on_fuel_button_pressed() -> void:
	upgrade_panel.states = upgrade_panel.states_enum.FUEL


func _on_engine_button_pressed() -> void:
	upgrade_panel.states = upgrade_panel.states_enum.ENGINE


func _on_n2o_button_pressed() -> void:
	upgrade_panel.states = upgrade_panel.states_enum.N2O


func _on_penetration_button_pressed() -> void:
	upgrade_panel.states = upgrade_panel.states_enum.PENETRATION


func _on_cancel_button_pressed() -> void:
	upgrade_panel.states = upgrade_panel.states_enum.HIDE


func _on_auto_button_toggled(toggled_on: bool) -> void:
	auto_button = toggled_on


func _on_start_button_pressed() -> void:
	PlayerManagement.auto = auto_button
	PlayerManagement.save()
	get_tree().change_scene_to_file("res://src/game/game.tscn")


func update_progressbars():
	$MarginContainer/CenterContainer/HBoxContainer/VBoxContainer/TextureProgressBar.value = \
	PlayerManagement.fuel
	$MarginContainer/CenterContainer/HBoxContainer/VBoxContainer2/TextureProgressBar2.value = \
	PlayerManagement.engine
	$MarginContainer/CenterContainer/HBoxContainer/VBoxContainer3/TextureProgressBar3.value = \
	PlayerManagement.n2o
	$MarginContainer/CenterContainer/HBoxContainer/VBoxContainer4/TextureProgressBar4.value = \
	PlayerManagement.penetration
