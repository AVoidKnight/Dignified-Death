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


func engine():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.show()
	$MarginContainer/n2o_panel.hide()
	$MarginContainer/penetration_panel.hide()
	$MarginContainer/engine_panel/Label3.text = \
	str(1 + PlayerManagement.engine * 0.25) + "x > " \
	+str(1 + (PlayerManagement.engine + 1) * 0.25) + "x"


func n2o():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.hide()
	$MarginContainer/n2o_panel.show()
	$MarginContainer/penetration_panel.hide()
	$MarginContainer/n2o_panel/Label3.text = \
	str(3 + PlayerManagement.n2o * 3) + "s > " \
	+ str(3 + (PlayerManagement.n2o + 1) * 3) + "s"


func penetration():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.hide()
	$MarginContainer/n2o_panel.hide()
	$MarginContainer/penetration_panel.show()
	$MarginContainer/penetration_panel/Label3.text = \
	str(1 - PlayerManagement.penetration * 0.15) + "x > " \
	+str(1 - (PlayerManagement.penetration + 1) * 0.15) + "x"
