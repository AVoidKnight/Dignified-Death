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
	_on_bl_pressed()
	click_through_window()

func _on_tr_pressed() -> void:
	print("TR_PRESSED")
	current_corner = TOP_RIGHT
	window_position.x = screen_size.x - window_size.x
	window_position.y = 0
	DisplayServer.window_set_position(window_position)


func _on_tl_pressed() -> void:
	print("TL_PRESSED")
	current_corner = TOP_LEFT
	window_position.x = 0
	window_position.y = 0
	DisplayServer.window_set_position(window_position)


func _on_bl_pressed() -> void:
	print("BL_PRESSED")
	current_corner = BOTTOM_LEFT
	window_position.x = 0
	window_position.y = screen_size.y - window_size.y - taskbar_height
	print(window_position)
	DisplayServer.window_set_position(window_position)


func _on_br_pressed() -> void:
	print("BR_PRESSED")
	current_corner = BOTTOM_RIGHT
	window_position.x = screen_size.x - window_size.x
	window_position.y = screen_size.y - window_size.y - taskbar_height
	print(window_position)
	DisplayServer.window_set_position(window_position)


func get_taskbar_height() -> int:
	return DisplayServer.screen_get_size().y - DisplayServer.screen_get_usable_rect().size.y


func click_through_window() -> void:
	pass
