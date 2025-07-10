extends Node
@onready var fuel_progressbar = get_tree().get_first_node_in_group("fuel_progressbar")
var fuel_active : bool = true
var fuel_upgrade : int:
	set(value):
		fuel_sec = 6 + 6 * fuel_upgrade
		$Timer.wait_time = fuel_sec
		print(fuel_sec)
		fuel_upgrade = value
var fuel_sec : float
@onready var base_car: RigidBody2D = $".."

func _physics_process(delta: float) -> void:
	if base_car.is_movable and Input.is_action_pressed("accelerate") and \
	base_car.bodies_entered > 0 and fuel_active:
		$Timer.paused = false
		fuel_progressbar.value = ($Timer.time_left / fuel_sec) * 100
	else: $Timer.paused = true
	print($Timer.time_left)


func _on_timer_timeout() -> void:
	print("Out of Fuel")
	base_car.is_movable = false
	fuel_progressbar.value = 0
