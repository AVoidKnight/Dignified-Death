extends Node

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("debugging_state"):
		WindowManagement.debug_window_change()
	elif Input.is_action_just_pressed("testing_state"):
		WindowManagement.test_window_change()
