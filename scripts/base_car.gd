extends Node2D

@onready var gravity_component: RigidBody2D = $GravityComponent
@onready var fix_l: Node2D = $base_car/FixL
@onready var fix_r: Node2D = $base_car/FixR
@onready var wheel_r: RigidBody2D = $WheelR
@onready var wheel_l: RigidBody2D = $WheelL
@onready var base_car: CharacterBody2D = $base_car
@export var wheels_distance_fix : float = 12.2
@export var max_speed : float = 300
var is_amor_l_touching : bool = false
var is_amor_r_touching : bool = false
var wheel_distance : Array[float]
var wheel_l_start_position: float
var wheel_r_start_position: float



func _physics_process(delta: float) -> void:
	if not base_car.is_on_floor():
		base_car.velocity.y = gravity_component.initiate_falling_and_return_velocity()
	else:
		gravity_component.stop_falling()
		if Input.is_action_pressed("ui_up"):
			base_car.velocity.x = lerp(base_car.velocity.x, max_speed, 1.0 - exp(-1 * delta))
	if is_zero_approx(base_car.velocity.x):
		wheel_l
	wheel_l.global_position.x = fix_l.global_position.x
	wheel_r.global_position.x = fix_r.global_position.x
	base_car.rotation = wheel_l.global_position.direction_to(wheel_r.global_position).angle()
	base_car.move_and_slide()
