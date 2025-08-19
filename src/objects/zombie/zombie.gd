extends CharacterBody2D
var is_dead : bool = false
var impulse_direction : int = 1

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
	var zombie_sans = randi_range(1,3)
	match zombie_sans:
		1:
			AudioManagement.play("res://assets/sounds/zombie-sound.mp3",0.0, 1.23)
		2:
			AudioManagement.play("res://assets/sounds/zombie-sound.mp3",1.68, 2.55)
		3:
			AudioManagement.play("res://assets/sounds/zombie-sound.mp3",3.0, 4.05)
	if Utils.player.get_node("RayCast2D").is_upside_down:
		impulse_direction = -1
	else: impulse_direction = 1
	Utils.player.apply_impulse(Utils.player.get_direction().normalized() * -1000 \
	* PlayerManagement.get_stat("penetration") * impulse_direction)
	ragdoll()


func ragdoll():
	LevelManagement.zombie_killed += 1
	var zombie_ragdoll = load("res://src/objects/zombie/zombie_ragdoll.tscn").instantiate()
	get_parent().add_child.call_deferred(zombie_ragdoll)
	zombie_ragdoll.global_position = self.global_position
	queue_free()
