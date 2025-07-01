extends Area2D
var player

func _ready() -> void:
	player = get_node("/root").get_child(-1).get_node("base_car")


func _tutor_hitbox(body: Node2D) -> void:
	player.is_movable = false
	while player.linear_velocity.x > 0:
		player.apply_central_force(Vector2.LEFT * 400)
