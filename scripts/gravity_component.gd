extends RigidBody2D
enum {IDLING, FALLING}
var state : int = IDLING


func _ready() -> void:
	gravity_scale = 0


func _physics_process(delta: float) -> void:
	if state == IDLING:
		gravity_scale = 0
		return
	if state == FALLING:
		gravity_scale = 1
		return


func initiate_falling_and_return_velocity() -> float:
	if state != FALLING:
		state = FALLING
	return linear_velocity.y


func stop_falling():
	global_position = Vector2.ZERO
	state = IDLING
