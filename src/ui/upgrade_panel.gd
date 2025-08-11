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


func engine():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.show()
	$MarginContainer/n2o_panel.hide()
	$MarginContainer/penetration_panel.hide()


func n2o():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.hide()
	$MarginContainer/n2o_panel.show()
	$MarginContainer/penetration_panel.hide()


func penetration():
	show()
	$MarginContainer/fuel_panel.hide()
	$MarginContainer/engine_panel.hide()
	$MarginContainer/n2o_panel.hide()
	$MarginContainer/penetration_panel.show()
