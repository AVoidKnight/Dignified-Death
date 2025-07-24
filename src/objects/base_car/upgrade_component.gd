extends Node
var upgrade_dictionary_1 : Dictionary
var fuel_upgrade
var save_resource : Resource

func _ready() -> void:
	save_resource = PlayerManagement.load_saved_resource()
	upgrades_to_nums(save_resource.upgrade_dictionary_1)


func upgrades_to_nums(upgrade_dictionary : Dictionary):
	fuel_upgrade = upgrade_dictionary.get("car_1_fuel_current_upgrade")
	$"../FuelComponent".fuel_upgrade = fuel_upgrade
	$"../FuelComponent/Timer".start()
