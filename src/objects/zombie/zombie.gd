extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity.x = -50
	if !is_on_floor():
		velocity.y += 60
	else:
		velocity.y = 0
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	ragdoll()


func ragdoll():
	pass
