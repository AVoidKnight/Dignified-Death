extends Node2D

@onready var fix_l: Node2D = $base_car/FixL
@onready var fix_r: Node2D = $base_car/FixR
@onready var wheel_l: CharacterBody2D = $WheelL
@onready var wheel_r: CharacterBody2D = $WheelR
@onready var base_car: RigidBody2D = $base_car
@onready var car_stabilizer_l: StaticBody2D = $WheelL/CarStabilizerL
@onready var car_stabilizer_r: StaticBody2D = $WheelR/CarStabilizerR
@export var wheels_distance_fix : float = 12.2
var saved_velocity : Array[Vector2]


func _ready() -> void:
	saved_velocity = [Vector2.ZERO, Vector2.ZERO]


func _physics_process(delta: float) -> void:
#handling gravity for every movable part of the car
	var character_bodies_array = get_tree().get_nodes_in_group("CharacterBodies")
	for i in character_bodies_array.size():
		var body = character_bodies_array[i]
		if body.get_class() == "CharacterBody2D":
			if not body.is_on_floor():
				body.velocity.y += 980 * delta
				if body.name == "WheelL":
					saved_velocity[0].y += 10
				elif body.name == "WheelR":
					saved_velocity[1].y += 10
			else: 
				if wheel_l.is_on_floor():
					saved_velocity[0].y = 0
				elif wheel_r.is_on_floor():
					saved_velocity[1].y = 0
			body.move_and_slide()

	_handling_wheels_fix(delta)

	car_stabilizer_l.rotation = base_car.rotation
	car_stabilizer_r.rotation = base_car.rotation


func _handling_wheels_fix(delta: float):
	print(get_wheel_distance())
# calc for left wheel
	if (get_wheel_distance()[0] > wheels_distance_fix):
		wheel_l.velocity += (fix_l.global_position - wheel_l.global_position) * 3
	else: wheel_l.velocity = saved_velocity[0]
	if (get_wheel_distance()[1] > wheels_distance_fix):
		wheel_r.velocity += (fix_r.global_position - wheel_r.global_position) * 3
	else: wheel_r.velocity = saved_velocity[1]

func get_wheel_distance() -> Array[float]:
	return [wheel_l.global_position.distance_to(fix_l.global_position), 
	wheel_r.global_position.distance_to(fix_r.global_position)]
