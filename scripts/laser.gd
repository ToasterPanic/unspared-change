extends RigidBody2D

var vector = null
var startAngle = null

func _ready() -> void:
	vector = linear_velocity
	startAngle = rotation

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if not startAngle:
		vector = linear_velocity
		startAngle = rotation	
	
	if linear_velocity.length() < (vector.length() - 1):
		await get_tree().create_timer(0.04).timeout
		queue_free()
		
	if abs(startAngle - rotation) >= 0.1:
		await get_tree().create_timer(0.04).timeout
		queue_free()
