extends Node
enum {BOTTOM_LEFT, BOTTOM_RIGHT}
@export var corner : int = 0
@export var size : int = 1

func corner_setting(id: int):
	match id:
		0:
			WindowManagement.move_to_bl_corner()
			corner = BOTTOM_LEFT
		1:
			WindowManagement.move_to_br_corner()
			corner = BOTTOM_RIGHT
	create_config()


func size_setting(id: int):
	size = id + 1
	WindowManagement.window_change_size(size)
	corner_setting(corner)
	create_config()


func create_config():
	var config = ConfigFile.new()
	config.set_value("Settings", "Corner", corner)
	config.set_value("Settings", "Size", size)
	config.save("user://config.cfg")
