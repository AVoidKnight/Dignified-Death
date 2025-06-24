extends Node2D
@export var wheels_distance_fix : float = 7.245
@onready var fix_l: Node2D = $base_car/FixL
@onready var fix_r: Node2D = $base_car/FixR
@onready var wheel_l: CharacterBody2D = $WheelL
@onready var wheel_r: CharacterBody2D = $WheelR
@onready var base_car: RigidBody2D = $base_car
@onready var car_stabilizer_l: StaticBody2D = $WheelL/CarStabilizerL
@onready var car_stabilizer_r: StaticBody2D = $WheelR/CarStabilizerR


func _physics_process(delta: float) -> void:
#handling gravity for every movable part of the car
	var character_bodies_array = get_tree().get_nodes_in_group("CharacterBodies")
	for i in character_bodies_array.size():
		var body = character_bodies_array[i]
		if body.get_class() == "CharacterBody2D":
			body.velocity.y += 980 / 60
			body.move_and_slide()

	_handling_wheels_fix(delta)

#	car_stabilizer_l.rotation = base_car.rotation
#	car_stabilizer_r.rotation = base_car.rotation


func _handling_wheels_fix(delta: float):
	print(get_wheel_distance())
# calc for left wheel
	if not (get_wheel_distance()[1] >= wheels_distance_fix - 0.5 and get_wheel_distance()[1] <= wheels_distance_fix + 0.5) :
		
		wheel_l.velocity += wheel_l.global_position.direction_to(fix_l.global_position)
	else: wheel_l.velocity.y += 980 / 60


func get_wheel_distance() -> Array[float]:
	return [wheel_l.global_position.distance_to(fix_l.global_position), 
	wheel_r.global_position.distance_to(fix_r.global_position)]
