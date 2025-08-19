extends Node
@onready var boost_progressbar = get_tree().get_first_node_in_group("boost_progressbar")
var boost_active : bool = true
var boost_sec : float
var boost_upgrade : int:
	set(value):
		boost_sec = 3 * value
		$Timer.wait_time = boost_sec
		boost_upgrade = value
@onready var base_car: RigidBody2D = $".."

func _physics_process(_delta: float) -> void:
	if base_car.is_movable and \
	(Input.is_action_pressed("boost") or PlayerManagement.auto == true) and \
	boost_active:
		$Timer.paused = false
		boost_progressbar.value = ($Timer.time_left / boost_sec) * 100
	else: $Timer.paused = true    


func _on_timer_timeout() -> void:
	boost_progressbar.value = 0
	boost_active = false
	base_car.boost_active = false
