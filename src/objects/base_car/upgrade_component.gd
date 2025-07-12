extends Node
var upgrade_dictionary : Dictionary
var fuel_upgrade

func _ready() -> void:
	if ResourceLoader.exists("user://upgrade_save.tres"):
		var upgrade_resource = ResourceLoader.load("user://upgrade_save.tres")
		upgrade_dictionary = upgrade_resource.upgrade_dictionary
	else: 
		var base_upgrade_resource = ResourceLoader.load("res://src/resources/base_upgrade_save.tres")
		ResourceSaver.save(base_upgrade_resource, "user://upgrade_save.tres")
	upgrades_to_nums()


func upgrades_to_nums():
	fuel_upgrade = upgrade_dictionary.get("car_1_fuel_current_upgrade")
	$"../FuelComponent".fuel_upgrade = fuel_upgrade
	$"../FuelComponent/Timer".start()
