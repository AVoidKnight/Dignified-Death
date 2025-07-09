extends Node2D
var window_position : Vector2i
var screen_size : Vector2i
var window_size : Vector2i
var taskbar_height : int
enum {TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT}
var current_corner : int

func _ready() -> void:
	window_size = DisplayServer.window_get_size()
	screen_size = DisplayServer.screen_get_size()
	taskbar_height = get_taskbar_height()
	SettingsManagement.corner_setting(0)


func move_to_tr_corner() -> void:
	print("TR_PRESSED")
	current_corner = TOP_RIGHT
	window_position.x = screen_size.x - window_size.x
	window_position.y = 0
	DisplayServer.window_set_position(window_position)


func move_to_tl_corner() -> void:
	print("TL_PRESSED")
	current_corner = TOP_LEFT
	window_position.x = 0
	window_position.y = 0
	DisplayServer.window_set_position(window_position)


func move_to_bl_corner() -> void:
	print("BL_PRESSED")
	current_corner = BOTTOM_LEFT
	window_position.x = 0
	window_position.y = screen_size.y - window_size.y - taskbar_height
	print(window_position)
	DisplayServer.window_set_position(window_position)


func move_to_br_corner() -> void:
	print("BR_PRESSED")
	current_corner = BOTTOM_RIGHT
	window_position.x = screen_size.x - window_size.x
	window_position.y = screen_size.y - window_size.y - taskbar_height
	print(window_position)
	DisplayServer.window_set_position(window_position)


func get_taskbar_height() -> int:
	return DisplayServer.screen_get_size().y - DisplayServer.screen_get_usable_rect().size.y


func debug_window_change() -> void:
	window_position = DisplayServer.screen_get_size() / 2
	DisplayServer.window_set_size(DisplayServer.screen_get_size())
	DisplayServer.window_set_position(Vector2.ZERO)


func test_window_change() -> void:
	DisplayServer.window_set_size(window_size)
	move_to_bl_corner()


func window_change_size(size: int):
	DisplayServer.window_set_size(Vector2(384, 180) * size)
	window_size = DisplayServer.window_get_size()
