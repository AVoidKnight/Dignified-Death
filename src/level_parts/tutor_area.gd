extends Area2D
var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _tutor_hitbox(body: Node2D) -> void:
	player.is_movable = false
	Input.action_press("brake")
	await player.car_stopped
	Input.action_release("brake")
	get_tree().change_scene_to_file("res://src/level_parts/upgrade_level.tscn")
