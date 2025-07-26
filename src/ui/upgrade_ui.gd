extends Control

func _ready() -> void:
	WindowManagement.corner_changed.connect(_on_corner_changed)
	_on_corner_changed()


func _on_corner_changed():
	match WindowManagement.current_corner:
		WindowManagement.BOTTOM_LEFT:
			get_tree().get_first_node_in_group("panel_with_play_button").size_flags_horizontal = 8
		WindowManagement.BOTTOM_RIGHT:
			get_tree().get_first_node_in_group("panel_with_play_button").size_flags_horizontal = 0
