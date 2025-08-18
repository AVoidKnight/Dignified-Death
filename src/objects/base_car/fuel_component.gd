extends Node
@onready var fuel_progressbar = get_tree().get_first_node_in_group("fuel_progressbar")
var fuel_active : bool = true
var fuel_upgrade : int:
	set(value):
		fuel_sec = 6 + 6 * value
		$Timer.wait_time = fuel_sec
		fuel_upgrade = value
var fuel_sec : float
@onready var base_car: RigidBody2D = $".."

func _ready() -> void:
	if ("fuel_active" in get_parent().get_parent()) == true:
		fuel_active = get_parent().get_parent().fuel_active 


func _physics_process(_delta: float) -> void:
	if base_car.is_movable and \
	(Input.is_action_pressed("accelerate") or PlayerManagement.auto == true) and \
	base_car.bodies_entered > 0 and fuel_active:
		$Timer.paused = false
		fuel_progressbar.value = ($Timer.time_left / fuel_sec) * 100
	else: $Timer.paused = true                                                                                                                                         


func _on_timer_timeout() -> void:
	base_car.is_movable = false
	fuel_progressbar.value = 0
	LevelManagement.level_end(Utils.player.position.x)
	await get_tree().create_timer(2).timeout
	get_tree().paused = false
	if PlayerManagement.auto == true:
		get_tree().change_scene_to_file("res://src/game/game.tscn")
	else:
		var end_ui = load("res://src/ui/level_end_ui.tscn")
		Utils.game.add_child(end_ui.instantiate())
