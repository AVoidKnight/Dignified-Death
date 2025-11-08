extends Sprite2D

func _ready() -> void:
	if PlayerManagement.finale == true:
		show()
