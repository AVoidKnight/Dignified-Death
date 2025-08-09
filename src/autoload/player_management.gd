extends Node
var money : int
var save_resource : Resource
var fuel : int = 0
var engine : int = 0 
var n2o : int = 0
var penetration : int = 0
signal update_stats
var updated_stats : bool

func load_saved_resource() -> Resource:
	if ResourceLoader.exists("user://save.tres"):
		save_resource = ResourceLoader.load("user://save.tres")
		print("Save resource loaded")
	else: 
		print("Save resource not found, loading base save...")
		base_save()
	return save_resource


func base_save():
	var base_save_resource = SaveResource.new()
	ResourceSaver.save(base_save_resource, "user://save.tres")
	save_resource = base_save_resource


func save():
	var save_resource = SaveResource.new()
	print_debug("Saving...")
	emit_signal("update_stats")
	while updated_stats != true:
		var _waiting
	await updated_stats
	save_resource.money = money
	save_resource.upgrade_dictionary_1 = upgrade_dict_create()
	print(save_resource.upgrade_dictionary_1)
	ResourceSaver.save(save_resource, "user://save.tres")


func upgrade_dict_create() -> Dictionary:
	var upgrade_dict = SaveResource.new().upgrade_dictionary_1
	upgrade_dict["car_1_fuel_current_upgrade"] = fuel
	upgrade_dict["car_1_engine_current_upgrade"] = engine
	upgrade_dict["car_1_n2o_current_upgrade"] = n2o
	upgrade_dict["car_1_penetration_current_upgrade"] = penetration
	return upgrade_dict


func distance_to_money(distance: float, auto: bool = false):
	print(distance)
