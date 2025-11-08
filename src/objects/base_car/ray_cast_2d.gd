extends RayCast2D
@onready var base_car = get_tree().get_first_node_in_group("player")
var is_upside_down : bool = false
var rerun_counter : int = 0

func _ready() -> void:
	rerun_counter = PlayerManagement.n2o
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
	if rerun_counter > 0:
		get_parent().position.y -= 50;
		get_parent().rotation = 0;
		rerun_counter -= 1;
		Utils.game.get_node("basic_ui/basic_ui").update_n2o_auto_icon(rerun_counter)
		return
	Utils.game.get_node("basic_ui/basic_ui").update_n2o_auto_icon(rerun_counter)
	$"../FuelComponent"._on_timer_timeout()
