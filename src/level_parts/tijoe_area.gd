extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Utils.player.get_node("FuelComponent")._on_timer_timeout()
