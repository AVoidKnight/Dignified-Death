extends Node
enum {BOTTOM_LEFT, BOTTOM_RIGHT}
@export var corner : int = 0
@export var size : int = 1
@export var volume : float = 0.5
@export var display : int = 0

func _ready() -> void:
	var config = ConfigFile.new()
	config.load("user://config.cfg")

#getting settings from cfg

	corner = config.get_value("Settings", "Corner", 0)
	size = config.get_value("Settings", "Size", 1)
	volume = config.get_value("Settings", "Volume", 0.5)
	display = config.get_value("Settings", "Display", 1)
	set_settings()


func set_settings():
	corner_setting(corner)
	volume_setting(volume)
	display_setting(display)
	size_setting(size - 1)
	create_config()

func corner_setting(id: int):
	match id:
		0:
			WindowManagement.move_to_bl_corner()
			corner = BOTTOM_LEFT
		1:
			WindowManagement.move_to_br_corner()
			corner = BOTTOM_RIGHT


func size_setting(id: int):
	size = id + 1
	WindowManagement.window_change_size(size)
	corner_setting(corner)


func volume_setting(value):
	volume = value
	AudioManagement.volume = volume


func display_setting(id: int):
	if display == -1 or DisplayServer.get_screen_count() - 1 < id:
		WindowManagement.display = DisplayServer.get_primary_screen()
		WindowManagement.start()
		return
	WindowManagement.display = display
	WindowManagement.start()
	display = id


func create_config():
	var config = ConfigFile.new()
	config.set_value("Settings", "Corner", corner)
	config.set_value("Settings", "Size", size)
	config.set_value("Settings", "Volume", volume)
	config.set_value("Settings", "Display", display)
	config.save("user://config.cfg")
