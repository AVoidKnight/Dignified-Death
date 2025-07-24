extends Node
var upgrade_dictionary_1 : Dictionary
var fuel_upgrade = 0
var engine_upgrade = 0
var n2o_upgrade = 0
var penetration_upgrade = 0
var save_resource : Resource
signal updated_stats

func _ready() -> void:
	PlayerManagement.update_stats.connect(upgrade_stats)
	save_resource = PlayerManagement.load_saved_resource()
	upgrade_dict_to_nums(save_resource.upgrade_dictionary_1)


func upgrade_dict_to_nums(upgrade_dictionary : Dictionary):
	fuel_upgrade = upgrade_dictionary.get("car_1_fuel_current_upgrade")
	$"../FuelComponent".fuel_upgrade = fuel_upgrade
	$"../FuelComponent/Timer".start()


func upgrade_stats():
	print_debug("Update stats signal received, updating stats...")
	PlayerManagement.fuel = fuel_upgrade
	PlayerManagement.engine = engine_upgrade
	PlayerManagement.n2o = n2o_upgrade
	PlayerManagement.penetration = penetration_upgrade
	PlayerManagement.emit_signal("updated_stats")
