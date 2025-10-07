extends MenuButton
var popup_menu : PopupMenu
var screen_count : int = 1

func _ready() -> void:
	screen_count = DisplayServer.get_screen_count()
	popup_menu = get_popup()
	print("Screen Count" + str(screen_count))
	for i in screen_count:
		popup_menu.add_check_item("Monitor " + str(i+1), i)
	popup_menu.set_item_checked(SettingsManagement.display - 1, true)
	popup_menu.id_pressed.connect(
		_on_option_chosen
			)


func _on_option_chosen(id : int):
	SettingsManagement.display = id
	SettingsManagement.set_settings()
	for i in 2:
		var is_true = (id == i)
		popup_menu.set_item_checked(i, is_true)
