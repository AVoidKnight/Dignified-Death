extends RigidBody2D

func initiate_falling_and_return_velocity() -> float:
	return linear_velocity.y
