extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_node("Area2D").monitoring = false
		
		var door = get_parent().get_node(get_meta("connected_door"))
		
		if door:
			door.free()
			
		queue_free()
