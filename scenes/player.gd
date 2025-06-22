extends CharacterBody2D

func _process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += 10
	move_and_slide()
