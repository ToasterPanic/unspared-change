extends Node2D

var playerIsInside = false
var player = null

func _physics_process(delta: float) -> void:
	if playerIsInside:
		player.apply_force(-(transform.y * get_meta("speed") * delta))

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		playerIsInside = true
		player = body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.get_name() == "Player":
		playerIsInside = false
