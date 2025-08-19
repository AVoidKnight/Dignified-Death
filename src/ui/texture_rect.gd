extends TextureRect
var is_shown : bool = false

func _ready() -> void:
	WindowManagement.clickthrough_state_changed.connect(icon_loop)
	icon_loop()


func icon_loop():
	print("icon_loop")
	if WindowManagement.clickthrough_window == true:
		$Timer.start()
	else:
		$Timer.stop()
		hide()


func _on_timer_timeout() -> void:
	visible = not visible
