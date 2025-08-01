extends RigidBody2D
var wheel_array : Array[Node]
@export var speed = 40
@export var max_speed = 30
var is_movable : bool = true
var bodies_entered : int = 0
signal car_stopped

func _ready() -> void:
	wheel_array = get_tree().get_nodes_in_group("wheel")
	for i in wheel_array.size():
		wheel_array[i].body_entered.connect(_on_wheels_body_entered)
		wheel_array[i].body_exited.connect(_on_wheels_body_exited)


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("accelerate") and is_movable:
		accelerate()
	if Input.is_action_pressed("boost") and is_movable:
		boost()
	if Input.is_action_pressed("brake"):
		brake()
		if linear_velocity.x < 5:
			car_stopped.emit()


func accelerate():
	for i in wheel_array.size():
			if wheel_array[i].angular_velocity < max_speed:
				wheel_array[i].apply_torque(1000 * speed * 
				get_physics_process_delta_time() * 60)


func boost():
	var direction = $PinJoint2D.global_position.direction_to($PinJoint2D2.global_position)
	apply_central_force(direction * 10000)


func brake():
	apply_central_force(Vector2.LEFT * 500)


func _on_wheels_body_entered(body: Node):
	bodies_entered += 1


func _on_wheels_body_exited(body: Node):
	bodies_entered -= 1
