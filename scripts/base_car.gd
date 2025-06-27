extends Node2D

@onready var gravity_component: RigidBody2D = $GravityComponent
@onready var base_car: CharacterBody2D = $base_car
@export var max_speed : float = 300
@export var wheel_array : Array[Node]


func _physics_process(delta: float) -> void:
	if not base_car.is_on_floor():
		base_car.velocity.y = gravity_component.initiate_falling_and_return_velocity()
	else:
		gravity_component.stop_falling()
		if Input.is_action_pressed("ui_up"):
			base_car.velocity.x = lerp(base_car.velocity.x, max_speed, 1.0 - exp(-1 * delta))
	base_car.move_and_slide()
