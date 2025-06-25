extends Node2D

@onready var fix_l: Node2D = $base_car/FixL
@onready var fix_r: Node2D = $base_car/FixR
@onready var wheel_l: RigidBody2D = $WheelL
@onready var wheel_r: RigidBody2D = $WheelR
@onready var base_car: RigidBody2D = $base_car
@onready var car_stabilizer_l: StaticBody2D = $WheelL/CarStabilizerL
@onready var car_stabilizer_r: StaticBody2D = $WheelR/CarStabilizerR
@export var wheels_distance_fix : float = 12.2
var is_amor_l_touching : bool = false
var is_amor_r_touching : bool = false
var wheel_distance : Array[float]


func _physics_process(delta: float) -> void:
	_handling_wheels_fix(delta)
	base_car.apply_force(Vector2.RIGHT * 520)
	wheel_l.apply_force(Vector2.RIGHT * 520)
	wheel_r.apply_force(Vector2.RIGHT * 520)


func _handling_wheels_fix(delta: float):
	wheel_distance = get_wheel_distance()
	if (get_wheel_distance()[0] > wheels_distance_fix):
		wheel_l.apply_force(fix_l.global_position - wheel_l.global_position)
	if (get_wheel_distance()[1] > wheels_distance_fix):
		wheel_r.apply_force(fix_r.global_position - wheel_r.global_position)


func get_wheel_distance() -> Array[float]:
	return [wheel_l.global_position.distance_to(fix_l.global_position), 
	wheel_r.global_position.distance_to(fix_r.global_position)]


func _on_amor_l_environment_touched(body: Node2D) -> void:
	print("MAMORL")
	is_amor_l_touching = true


func _on_amor_r_environment_touched(body: Node2D) -> void:
	is_amor_r_touching = true
	print("MAMORR")


func _on_amor_l_body_exited(body: Node2D) -> void:
	is_amor_l_touching = false 


func _on_amor_r_body_exited(body: Node2D) -> void:
	is_amor_r_touching = false
