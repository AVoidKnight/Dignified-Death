extends Node
var upgrade_dictionary_1 : Dictionary
var fuel_upgrade = 0
var engine_upgrade = 0
var n2o_upgrade = 0
var penetration_upgrade = 0
var save_resource : Resource
signal updated_stats

func _ready() -> void:
	saved_upgrades_to_nums()


func saved_upgrades_to_nums():
	fuel_upgrade = PlayerManagement.fuel
	$"../FuelComponent".fuel_upgrade = fuel_upgrade
	$"../FuelComponent/Timer".start()
