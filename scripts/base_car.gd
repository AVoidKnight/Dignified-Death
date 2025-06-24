extends Node2D
@export var wheels_distance_fix : float = 7.245
@onready var fix_l: Node2D = $base_car/FixL
@onready var fix_r: Node2D = $base_car/FixR
@onready var wheel_l: CharacterBody2D = $WheelL
@onready var wheel_r: CharacterBody2D = $WheelR
@onready var base_car: CharacterBody2D = $base_car
@onready var car_stabilizer_l: StaticBody2D = $WheelL/CarStabilizerL
@onready var car_stabilizer_r: StaticBody2D = $WheelR/CarStabilizerR


func _physics_process(delta: float) -> void:
#handling gravity for every movable part of the car
	var character_bodies_array = get_tree().get_nodes_in_group("CharacterBodies")
	for i in character_bodies_array.size():
		character_bodies_array[i].velocity.y += 10
		character_bodies_array[i].move_and_slide()

	_handling_wheels_fix(delta)

	car_stabilizer_l.rotation = base_car.rotation
	car_stabilizer_r.rotation = base_car.rotation


func _handling_wheels_fix(delta: float):
	print(get_distance_between_fix_and_wheel())
	return


func get_distance_between_fix_and_wheel() -> Array[float]:
	return [wheel_l.global_position.distance_to(fix_l.global_position), 
	wheel_r.global_position.distance_to(fix_r.global_position)]
