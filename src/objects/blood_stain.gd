extends Sprite2D

func _ready() -> void:
	var blood_array : Array = Utils.player.get_node("BloodComponent").blood_positions
	var random_position = blood_array.pick_random()
	if PlayerManagement.penetration < 1:
		random_position.x -= 15
	self.global_position = get_parent().global_position + random_position
	self.rotation_degrees = randi_range(0,360)
	var scaler = randf_range(0.8, 1.2)
	self.scale = Vector2(scaler, scaler)
	await get_tree().create_timer(0.5).timeout
	while modulate.a > 0:
		modulate.a -= 0.02
		if is_instance_valid(get_tree()):
			await get_tree().create_timer(0.01).timeout
