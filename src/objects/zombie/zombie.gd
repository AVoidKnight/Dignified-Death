extends CharacterBody2D
var is_dead : bool = false

func _physics_process(_delta: float) -> void:
	velocity.x = -50
	if !is_on_floor():
		velocity.y += 60
	else:
		velocity.y = 0
	move_and_slide()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if is_dead == true:
		return
	is_dead = true
	ragdoll()


func ragdoll():
	LevelManagement.zombie_killed += 1
	var zombie_ragdoll = load("res://src/objects/zombie/zombie_ragdoll.tscn").instantiate()
	get_parent().add_child.call_deferred(zombie_ragdoll)
	zombie_ragdoll.global_position = self.global_position
	queue_free()
