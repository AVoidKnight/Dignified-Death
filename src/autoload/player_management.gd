extends Node
signal money_changed
var money : int:
	set(value):
		emit_signal("money_changed")
		money = value
var save_resource : Resource
var fuel : int = 0
var engine : int = 0 
var n2o : int = 0
var penetration : int = 0
var penetration_converted : float = -1
var auto : bool = false
var updated_stats : bool

func _ready() -> void:
	load_saved_resource()
	load_data()


func load_saved_resource():
	if ResourceLoader.exists("user://save.tres"):
		save_resource = ResourceLoader.load("user://save.tres")
		print("Save resource loaded")
	else: 
		print("Save resource not found, loading base save...")
		base_save()


func base_save():
	var base_save_resource = SaveResource.new()
	ResourceSaver.save(base_save_resource, "user://save.tres")
	save_resource = base_save_resource


func save():
	var save_resource_temp = SaveResource.new()
	print_debug("Saving...")
	save_resource_temp.money = money
	save_resource_temp.upgrade_dictionary_1 = upgrade_dict_create()
	save_resource_temp.auto = auto
	ResourceSaver.save(save_resource_temp, "user://save.tres")


func upgrade_dict_create() -> Dictionary:
	var upgrade_dict = SaveResource.new().upgrade_dictionary_1
	upgrade_dict["car_1_fuel_current_upgrade"] = fuel
	upgrade_dict["car_1_engine_current_upgrade"] = engine
	upgrade_dict["car_1_n2o_current_upgrade"] = n2o
	upgrade_dict["car_1_penetration_current_upgrade"] = penetration
	return upgrade_dict


func load_data():
	money = save_resource.money
	var upgrade_dict = save_resource.upgrade_dictionary_1
	fuel = upgrade_dict["car_1_fuel_current_upgrade"]
	engine = upgrade_dict["car_1_engine_current_upgrade"]
	n2o = upgrade_dict["car_1_n2o_current_upgrade"]
	penetration = upgrade_dict["car_1_penetration_current_upgrade"]
	auto = save_resource.auto


func get_stat(stat: String) -> Variant:
	match stat:
		"fuel":
			return fuel
		"engine":
			return engine
		"n2o":
			return n2o
		"penetration":
			if penetration_converted == -1:
				penetration_converted = 1 - 0.15 * penetration
			return penetration_converted
		_:
			return 0
