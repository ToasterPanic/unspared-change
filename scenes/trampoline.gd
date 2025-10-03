extends RigidBody2D

func _body_entered(body) -> void:
	if body.get_class() == "RigidBody2D":
		body.position.y += 4
		body.linear_velocity.y = -(get_meta("bounciness"))
		body.linear_velocity.x += angular_velocity * 17
