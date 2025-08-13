extends PanelContainer
enum states_enum {HIDE, FUEL, ENGINE, N2O, PENETRATION}
var states:
	set(value):
		match value:
			states_enum.HIDE:
				hide()
			states_enum.FUEL:
				fuel()
			states_enum.ENGINE:
				engine()
			states_enum.N2O:
				n2o()
			states_enum.PENETRATION:
				penetration()
		states = value
var upgrade_resource = UpgradeResource.new()

func _ready() -> void:
	states = states_enum.HIDE


func fuel():
	show()
	$MarginContainer/fuel_panel.show()
	$MarginContainer/engine_panel.hide()
	$MarginContainer/n2o_panel.hide()
	$MarginContainer/penetration_panel.hide()
	$MarginContainer/fuel_panel/Label3.text = \
	str(6 + PlayerManagement.fuel * 6) + "s > " \
	+ str(6 + (PlayerManagement.fuel + 1) * 6) + "s"
	if PlayerManagement.fuel < upgrade_resource.fuel_price.size():
		$MarginContainer/fuel_panel/TextureButton/Label.text = \
		"$" + str(upgrade_resource.fuel_price[PlayerManagement.fuel])
	else: $MarginContainer/fuel_panel/TextureButton/Label.text = "-"
	$"../..".update_progressbars()


func engine():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.show()
	$MarginContainer/n2o_panel.hide()
	$MarginContainer/penetration_panel.hide()
	$MarginContainer/engine_panel/Label3.text = \
	str(1 + PlayerManagement.engine * 0.25) + "x > " \
	+str(1 + (PlayerManagement.engine + 1) * 0.25) + "x"
	if PlayerManagement.engine < upgrade_resource.engine_price.size():
		$MarginContainer/engine_panel/TextureButton/Label.text = \
		"$" + str(upgrade_resource.engine_price[PlayerManagement.engine])
	else: $MarginContainer/engine_panel/TextureButton/Label.text = "-"
	$"../..".update_progressbars()


func n2o():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.hide()
	$MarginContainer/n2o_panel.show()
	$MarginContainer/penetration_panel.hide()
	$MarginContainer/n2o_panel/Label3.text = \
	str(3 + PlayerManagement.n2o * 3) + "s > " \
	+ str(3 + (PlayerManagement.n2o + 1) * 3) + "s"
	if PlayerManagement.n2o < upgrade_resource.n2o_price.size():
		$MarginContainer/n2o_panel/TextureButton/Label.text = \
		"$" + str(upgrade_resource.n2o_price[PlayerManagement.n2o])
	else: $MarginContainer/n2o_panel/TextureButton/Label.text = "-"
	$"../..".update_progressbars()


func penetration():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.hide()
	$MarginContainer/n2o_panel.hide()
	$MarginContainer/penetration_panel.show()
	$MarginContainer/penetration_panel/Label3.text = \
	str(1 - PlayerManagement.penetration * 0.15) + "x > " \
	+str(1 - (PlayerManagement.penetration + 1) * 0.15) + "x"
	if PlayerManagement.penetration < upgrade_resource.penetration_price.size():
		$MarginContainer/penetration_panel/TextureButton/Label.text = \
		"$" + str(upgrade_resource.penetration_price[PlayerManagement.penetration])
	else: $MarginContainer/penetration_panel/TextureButton/Label.text = "-"
	$"../..".update_progressbars()


func _on_fuel_button_pressed() -> void:
	print("fuel")
	var price = upgrade_resource.fuel_price[PlayerManagement.fuel]
	if price < PlayerManagement.money:
		PlayerManagement.money -= price
		PlayerManagement.fuel += 1
	fuel()


func _on_engine_button_pressed() -> void:
	print("engine")
	var price = upgrade_resource.engine_price[PlayerManagement.engine]
	if price < PlayerManagement.money:
		PlayerManagement.money -= price
		PlayerManagement.engine += 1
	engine()


func _on_n2o_button_pressed() -> void:
	print("n2o")
	var price = upgrade_resource.n2o_price[PlayerManagement.n2o]
	if price < PlayerManagement.money:
		PlayerManagement.money -= price
		PlayerManagement.n2o += 1
	n2o()


func _on_penetration_button_pressed() -> void:
	print("penetration")
	var price = upgrade_resource.penetration_price[PlayerManagement.penetration]
	if price < PlayerManagement.money:
		PlayerManagement.money -= price
		PlayerManagement.penetration += 1
	penetration()
