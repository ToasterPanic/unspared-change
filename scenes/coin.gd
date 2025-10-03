extends RigidBody2D

var reset = false

func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		angular_velocity -= 64 * delta
	if Input.is_action_pressed("move_right"):
		angular_velocity += 64 * delta
		
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if reset:
		if $Camera2D.zoom.x > 0.55:
			print( $Camera2D.zoom)
			return
		
		global.deaths += 1
		
		linear_velocity = Vector2(0, 0)
		angular_velocity = 0
		state.transform = Transform2D(0.0, global.checkpoint.position)
		reset = false

func _input(event):
	if event.is_action_pressed("reset"):
		if global.checkpoint:
			reset = true
			
func _on_body_entered(body: Node) -> void:
	print(body.get_name())
	
	if body.get_name() == "KillTiles":
		reset = true
	if (body.get_name() == "Laser") or ((body.get_class() == "RigidBody2D") and body.has_meta("Laser")):
		reset = true
