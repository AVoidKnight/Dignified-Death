extends Node
var upgrade_dictionary_1 : Dictionary
var fuel_upgrade = 0
var engine_upgrade = 0
var n2o_upgrade = 0
var penetration_upgrade = 0
var save_resource : Resource

func _ready() -> void:
	saved_upgrades_to_nums()


func saved_upgrades_to_nums():
	engine_upgrade = PlayerManagement.engine
	n2o_upgrade = PlayerManagement.n2o
	fuel_upgrade = PlayerManagement.fuel
	penetration_upgrade = PlayerManagement.penetration
	$"..".engine_upgrade = engine_upgrade
	$"../FuelComponent".fuel_upgrade = fuel_upgrade
	$"../BoostComponent".boost_upgrade = n2o_upgrade
	$"../FuelComponent/Timer".start()
	$"../BoostComponent/Timer".start()
