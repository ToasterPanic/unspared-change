extends Node2D

func _process(delta):
	get_node("ParallaxFront").position.x = (get_parent().get_node("Player").get_node("Camera2D").get_canvas_transform().origin.x / 9) + 1200
	get_node("ParallaxFront").position.y = (get_parent().get_node("Player").get_node("Camera2D").get_canvas_transform().origin.y / 9) - 2400
