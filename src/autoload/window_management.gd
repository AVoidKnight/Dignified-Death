extends Node2D
var window_position : Vector2i
var screen_size : Vector2i
var window_size : Vector2i
var taskbar_height : int
var current_corner : int
var clickthrough_window: bool
enum {TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT}
signal corner_changed
signal clickthrough_state_changed

func _ready() -> void:
	TransparentWindow.SetClickThrough(false)
	print(window_position)
	window_size = DisplayServer.window_get_size(DisplayServer.get_primary_screen())
	screen_size = DisplayServer.screen_get_size(DisplayServer.get_primary_screen())
	taskbar_height = get_taskbar_height()


func move_to_bl_corner() -> void:
	print("BL_PRESSED")
	current_corner = BOTTOM_LEFT
	window_position = DisplayServer.screen_get_position(DisplayServer.get_primary_screen())
	window_position.y += screen_size.y - window_size.y - taskbar_height
	print(window_position)
	DisplayServer.window_set_position(window_position)
	emit_signal("corner_changed")


func move_to_br_corner() -> void:
	print("BR_PRESSED")
	current_corner = BOTTOM_RIGHT
	window_position = DisplayServer.screen_get_position(DisplayServer.get_primary_screen())
	window_position.x += screen_size.x - window_size.x
	window_position.y += screen_size.y - window_size.y - taskbar_height
	print(window_position)
	DisplayServer.window_set_position(window_position)
	emit_signal("corner_changed")


func get_taskbar_height() -> int:
	return DisplayServer.screen_get_size(DisplayServer.get_primary_screen()).y \
	- DisplayServer.screen_get_usable_rect(DisplayServer.get_primary_screen()).size.y


func debug_window_change() -> void:
	window_position = DisplayServer.screen_get_size() / 2
	DisplayServer.window_set_size(DisplayServer.screen_get_size())
	DisplayServer.window_set_position(Vector2.ZERO)


func test_window_change() -> void:
	DisplayServer.window_set_size(window_size)
	move_to_bl_corner()


func window_change_size(size: float):
	DisplayServer.window_set_size(Vector2(384, 180) * size)
	window_size = DisplayServer.window_get_size()


func clickthrough_window_state_change():
	match clickthrough_window:
		true:
			clickthrough_window = false
			TransparentWindow.SetClickThrough(false)
		false:
			clickthrough_window = true
			TransparentWindow.SetClickThrough(true)
	emit_signal("clickthrough_state_changed")
