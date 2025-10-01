extends RigidBody2D

var positive = true

func _ready() -> void:
	linear_velocity = Vector2(get_meta("horizontial_speed"), get_meta("vertical_speed"))
	
	if get_meta("wait_until_area_touched") == true:
		set_deferred("freeze", true)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	angular_velocity = 0
	rotation = 0
	
	if abs(linear_velocity.x) < 12:
		if abs(linear_velocity.y) < 12:
			if has_meta("wait_until_area_touched") and get_meta("wait_until_area_touched"):
				positive = true
			else:
				positive = not positive 
			
			if positive:
				linear_velocity = Vector2(get_meta("horizontial_speed"), get_meta("vertical_speed"))
			else:
				linear_velocity = Vector2(get_meta("horizontial_speed") * -1, get_meta("vertical_speed") * -1)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		set_deferred("freeze", false)
		linear_velocity = Vector2(get_meta("horizontial_speed"), get_meta("vertical_speed"))
