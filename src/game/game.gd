extends Node2D


func _on_tr_pressed() -> void:
	WindowManagement.move_to_tr_corner()


func _on_tl_pressed() -> void:
	WindowManagement.move_to_tl_corner()


func _on_bl_pressed() -> void:
	WindowManagement.move_to_bl_corner()


func _on_br_pressed() -> void:
	WindowManagement.move_to_br_corner()
