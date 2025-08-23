extends Node

@onready var zombie_preload = preload("res://src/objects/zombie/zombie.tscn")
var auto : bool = false
var zombie_killed : int = 0
var level_array : Array[int]
var zombie_money : int
var distance_money : int
const level_part_path : String = "res://src/level_parts/main_level_parts/level_part_"
const distance_coef : float = 0.025
const zombie_coef: int = 5

func _ready():
	reset_level_array()


#random level generator
func rlg(levels_node : Node, position_reference : Node):
	if level_array.is_empty():
		reset_level_array()
	var level_number = level_array.pick_random()
	var new_level_path = level_part_path + str(level_number) + ".tscn"
	level_array.erase(level_number)
	print(new_level_path)
	var level = load(new_level_path).instantiate()
	levels_node.add_child(level)
	level.global_position = position_reference.global_position
	level.global_position.x += position_reference.end_position.x * 6
	level.global_position.y += position_reference.end_position.y * 6

#adding zombies
	var zombie_quantity : int = randi_range(6, 9)
	var points = Array(level.get_node("Line2D").points)
	for current_zombie in zombie_quantity:
		var current_point = points.pick_random()
		points.erase(current_point)
		var zombie_instance = zombie_preload.instantiate()
		levels_node.get_parent().add_child.call_deferred(zombie_instance)
		zombie_instance.global_position = level.global_position + current_point * 6 + Vector2(0, -20) 
		


func reset_level_array():
	var base_level_array : Array[int] = [1,2,3]
	level_array = base_level_array


func level_end(distance : float):
	var end_money : int = calc_money(distance)
	zombie_killed = 0
	PlayerManagement.money += end_money
	PlayerManagement.is_first_launch = false
	PlayerManagement.save()


func calc_money(distance : float) -> int:
	distance_money = floori((distance * distance_coef) * (1 - int(LevelManagement.auto) * 0.75))
	zombie_money = floori(zombie_killed * zombie_coef * \
	(1 - float(LevelManagement.auto) * (0.75 - 0.75 * (0.25) * float(PlayerManagement.n2o))))
	return (distance_money + zombie_money)
