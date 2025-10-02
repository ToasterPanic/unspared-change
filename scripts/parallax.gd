extends Node2D

func _process(delta):
	if get_node("ParallaxFront"):
		get_node("ParallaxFront").position.x = (get_parent().get_parent().get_node("Player").get_node("Camera2D").get_canvas_transform().origin.x / 9) + 1200
		get_node("ParallaxFront").position.y = (get_parent().get_parent().get_node("Player").get_node("Camera2D").get_canvas_transform().origin.y / 9)
		
		if get_name() == "Parallax3":
			get_node("ParallaxFront").position.y -= 20000
			get_node("ParallaxFront").position.x += 500
		elif get_name() == "Parallax2":
			get_node("ParallaxFront").position.y -= 7500
		else:
			get_node("ParallaxFront").position.y -= 2300
