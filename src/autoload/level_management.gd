extends Node

var zombie_killed : int = 0
var auto : bool = false
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

	var level_number = level_array.pick_random()
	if level_number == null:
		reset_level_array()
		level_number = level_array.pick_random()
	var new_level_path = level_part_path + str(level_number) + ".tscn"
	level_array.erase(level_number)
	print(new_level_path)
	var level = load(new_level_path).instantiate()
	levels_node.add_child(level)
	level.global_position = position_reference.global_position
	level.global_position.x += position_reference.end_position.x * 6
	level.global_position.y += position_reference.end_position.y * 6


func reset_level_array():
	var base_level_array : Array[int] = [1,2,3]
	level_array = base_level_array


func level_end(distance : float):
	var end_money : int = calc_money(distance)
	PlayerManagement.money += end_money
	PlayerManagement.save()


func calc_money(distance : float) -> int:
	distance_money = floori(distance * distance_coef)
	zombie_money = zombie_killed * zombie_coef
	return (distance_money + zombie_money)
