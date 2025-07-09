extends MenuButton
var popup_menu : PopupMenu

func _ready() -> void:
	popup_menu = get_popup()
	popup_menu.set_item_checked(WindowManagement.current_corner - 2, true)
	popup_menu.id_pressed.connect(
		_on_option_chosen
			)


func _on_option_chosen(id : int):
	SettingsManagement.corner_setting(id)
	popup_menu.set_item_checked(0, bool(!id))
	popup_menu.set_item_checked(1, bool(id))
