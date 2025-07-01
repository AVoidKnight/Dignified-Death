extends RigidBody2D
var wheel_array : Array[Node]
@export var speed = 40
@export var max_speed = 30
var is_movable : bool = true

func _ready() -> void:
	wheel_array = get_tree().get_nodes_in_group("wheel")


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("accelerate") and is_movable:
		for i in wheel_array.size():
			if wheel_array[i].angular_velocity < max_speed:
				wheel_array[i].apply_torque(1000 * speed * delta * 60)
	if Input.is_action_pressed("boost") and is_movable:
		var direction = $PinJoint2D.global_position.direction_to($PinJoint2D2.global_position)
		apply_central_force(direction * 10000)
