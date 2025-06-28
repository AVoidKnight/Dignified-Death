extends RigidBody2D
var wheel_array : Array[Node]
@export var speed = 60000
@export var max_speed = 50

func _ready() -> void:
	wheel_array = get_tree().get_nodes_in_group("wheel")


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("accelerate"):
		for i in wheel_array.size():
			if wheel_array[i].angular_velocity < max_speed:
				wheel_array[i].apply_torque(speed * delta * 60)
