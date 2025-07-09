extends Node
enum {BOTTOM_LEFT, BOTTOM_RIGHT}
@export var corner : int = 0
@export var size : int = 1

func corner_setting(id: int):
	match id:
		0:
			WindowManagement.move_to_bl_corner()
			corner = BOTTOM_LEFT
			get_tree().get_first_node_in_group("pause_button").size_flags_horizontal = 0
		1:
			WindowManagement.move_to_br_corner()
			corner = BOTTOM_RIGHT
			get_tree().get_first_node_in_group("pause_button").size_flags_horizontal = 8


func size_setting(id: int):
	size = id + 1
	WindowManagement.window_change_size(size)
	corner_setting(corner)
