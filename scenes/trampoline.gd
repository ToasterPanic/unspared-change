extends RigidBody2D

func _body_entered(body) -> void:
	if body.get_class() == "RigidBody2D":
		body.apply_impulse(Vector2(0, -(get_meta("bounciness"))))
