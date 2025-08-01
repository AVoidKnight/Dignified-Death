extends Node

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debugging_state"):
		WindowManagement.debug_window_change()
	elif Input.is_action_just_pressed("testing_state"):
		WindowManagement.test_window_change()
		PlayerManagement.save()
	if Input.is_key_pressed(KEY_ALT):
		TransparentWindow.SetClickThrough(true)
	else:
		TransparentWindow.SetClickThrough(false)
