extends Node

var auto : bool = false
var level_array : Array[int]

const level_part_path : String = "res://src/level_parts/main_level_parts/level_part_"

func _ready():
	reset_level_array()


#random level generator
func rlg(parent : Node):

	var level_number = level_array.pick_random()
	if level_number == null:
		reset_level_array()
	var new_level_path = level_part_path + str(level_number) + ".tscn"
	level_array.erase(level_number)

	var level = load(new_level_path).instantiate()
	parent.add_child(level)
	level.global_position = parent.global_position
	level.global_position.x += parent.end_position.x * 6
	level.global_position.y += parent.end_position.y


func reset_level_array():
	var base_level_array : Array[int] = [1,2,3]
	level_array = base_level_array
