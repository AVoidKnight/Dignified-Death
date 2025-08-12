extends Node2D
var end_position = Vector2.ZERO
var fuel_active = true
@onready var ui_preload = preload("res://src/ui/level_end_auto_ui.tscn")

func _ready() -> void:
	if PlayerManagement.auto == true:
		$basic_ui.add_child(ui_preload.instantiate())
	Utils.game = self
