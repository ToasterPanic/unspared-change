extends RigidBody2D

func _ready() -> void:
	var area = get_node("Area2D")

func _physics_process(delta: float) -> void:
	var area = get_node("Area2D")
	for n in area.get_overlapping_bodies():
		if n.get_name() == "Player":
			n.apply_force(Vector2(0, -100000 * delta))
			if Input.is_action_pressed("move_left"):
				n.apply_force(Vector2(-20000 * delta, 0))
			if Input.is_action_pressed("move_right"):
				n.apply_force(Vector2(20000 * delta, 0))
