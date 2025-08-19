extends TextureButton
var end_progress
var is_impending_doom_initiated : bool = false


func _on_button_down() -> void:
	end_progress = Utils.game.get_node("basic_ui/TextureProgressBar")
	end_progress.show()
	is_impending_doom_initiated = true
	$Timer.start()


func _process(_delta: float) -> void:
	if is_impending_doom_initiated:
		end_progress.value = ($Timer.time_left / $Timer.wait_time) * 100
		print(get_global_mouse_position())
		end_progress.global_position = get_global_mouse_position() + Vector2(10, 20)


func _on_button_up() -> void:
	end_progress = Utils.game.get_node("basic_ui/TextureProgressBar")
	$Timer.stop()
	end_progress.hide()
	is_impending_doom_initiated = false


func _on_timer_timeout() -> void:
	print("bb_save_:crying_emoji:")
	PlayerManagement.delete_save()
