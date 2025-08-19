extends RayCast2D
@onready var base_car = get_tree().get_first_node_in_group("player")
var is_upside_down : bool = false

func _ready() -> void:
	$Timer.start()


func _physics_process(_delta: float) -> void:
	if ((global_rotation_degrees > -280 and global_rotation_degrees < -80) or \
	(global_rotation_degrees > 80 and global_rotation_degrees < 280)) and base_car.is_movable:
		is_upside_down = true
		$Timer.paused = false
	else:
		is_upside_down = false
		$Timer.start()
		$Timer.paused = true

func _on_timer_timeout() -> void:
	$"../FuelComponent"._on_timer_timeout()
