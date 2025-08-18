extends Node
enum {BOTTOM_LEFT, BOTTOM_RIGHT}
@export var corner : int = 0
@export var size : int = 1
@export var volume : float = 0.5

func _ready() -> void:
	var config = ConfigFile.new()
	config.load("user://config.cfg")

#getting settings from cfg

	corner = config.get_value("Settings", "Corner", 0)
	size = config.get_value("Settings", "Size", 1)
	volume = config.get_value("Settings", "Volume", 0.5)

 
#setting settings from cfg

	corner_setting(corner)
	size_setting(size - 1)
	volume_setting(volume)

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

func volume_setting(value):

func create_config():
	var config = ConfigFile.new()
	config.set_value("Settings", "Corner", corner)
	config.set_value("Settings", "Size", size)
	config.set_value("Settings", "Volume", volume)
	config.save("user://config.cfg")
