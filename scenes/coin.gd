extends RigidBody2D

func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		# Move as long as the key/button is pressed.
		angular_velocity -= 64 * delta
	if Input.is_action_pressed("move_right"):
		# Move as long as the key/button is pressed.
		angular_velocity += 64 * delta
