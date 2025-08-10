extends Node2D
var end_position = Vector2.ZERO
var fuel_active = false

func _ready() -> void:
	TransparentWindow.SetClickThrough(false)
	Utils.game = self
