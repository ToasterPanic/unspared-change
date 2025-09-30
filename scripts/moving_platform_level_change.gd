extends RigidBody2D

func _ready() -> void:
	set_deferred("freeze", true)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	angular_velocity = 0
	rotation = 0
	
	if abs(linear_velocity.x) < 12:
		if abs(linear_velocity.y) < 12:
			linear_velocity = Vector2(get_meta("horizontial_speed"), get_meta("vertical_speed"))


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		set_deferred("freeze", false)
		linear_velocity = Vector2(get_meta("horizontial_speed"), get_meta("vertical_speed"))
