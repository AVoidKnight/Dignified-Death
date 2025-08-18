extends RigidBody2D
var wheel_array : Array[Node]
var particles_array : Array
@export var speed = 40
@export var max_speed = 30
var engine_upgrade : int:
	set(value):
		speed = 40 * (1 + value * 0.25)
		max_speed = 30 * (1 + value * 0.25)
var is_movable : bool = true
var boost_active : bool = true
var bodies_entered : int = 0
signal car_stopped

func _ready() -> void:
	Utils.player = self
	wheel_array = get_tree().get_nodes_in_group("wheel")
	for i in wheel_array.size():
		wheel_array[i].body_entered.connect(_on_wheels_body_entered)
		wheel_array[i].body_exited.connect(_on_wheels_body_exited)
		var particles = load("res://src/objects/wheel_particles.tscn").instantiate()
		self.add_child(particles)
		particles.global_position = wheel_array[i].global_position + Vector2(0,11)
		particles.emitting = false
		particles_array.append(particles)


func _physics_process(_delta: float) -> void:
	if get_parent().name == "upgrade_level":
		return
	if (Input.is_action_pressed("accelerate") or PlayerManagement.auto == true) and is_movable:
		accelerate()
	if Input.is_action_pressed("boost") and is_movable \
	and PlayerManagement.auto == false and boost_active == true:
		boost()
	else:
		$BoostComponent/Timer.paused = true
	if (Input.is_action_pressed("brake") and PlayerManagement.auto == false) or !is_movable:
		brake()
		if linear_velocity.x < 5:
			car_stopped.emit()
	for i in particles_array.size():
		particles_array[i].global_position = wheel_array[i].global_position + Vector2(0,11)
		if (self.linear_velocity.length() < 5 and self.linear_velocity.length() > -5) \
		or !wheel_array[i].get_colliding_bodies().any(func(node): return node.name == "LevelPart"):
			particles_array[i].emitting = false
		else:
			particles_array[i].emitting = true
			particles_array[i].initial_velocity_min = self.linear_velocity.length()
			particles_array[i].initial_velocity_max = self.linear_velocity.length()


func accelerate():
	for i in wheel_array.size():
			if wheel_array[i].angular_velocity < max_speed:
				wheel_array[i].apply_torque(1000 * speed * 
				get_physics_process_delta_time() * 60)


func boost():
	$BoostComponent/Timer.paused = false
	apply_central_force(get_direction() * 10000)


func deboost():
	pass


func brake():
	apply_central_force(Vector2.LEFT * 500)


func _on_wheels_body_entered(_body: Node):
	bodies_entered += 1


func _on_wheels_body_exited(_body: Node):
	bodies_entered -= 1


func get_direction() -> Vector2:
	return $PinJoint2D.global_position.direction_to($PinJoint2D2.global_position)
