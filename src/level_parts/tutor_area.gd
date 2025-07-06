extends Area2D
var player

func _ready() -> void:
	player = get_node("/root").get_child(-1).get_node("base_car")


func _tutor_hitbox(body: Node2D) -> void:
	player.is_movable = false
	Input.action_press("brake")
