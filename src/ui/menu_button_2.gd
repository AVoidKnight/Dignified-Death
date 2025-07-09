extends MenuButton
var popup_menu : PopupMenu

func _ready() -> void:
	popup_menu = get_popup()
	popup_menu.set_item_checked(SettingsManagement.size - 1, true)
	popup_menu.id_pressed.connect(
		_on_option_chosen
			)


func _on_option_chosen(id : int):
	SettingsManagement.size_setting(id)
	for i in 2:
		var is_true = (id == i)
		popup_menu.set_item_checked(i, is_true)
