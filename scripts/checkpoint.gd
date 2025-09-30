extends Node2D

func _ready() -> void:
	get_node("NoFlag").play()
	get_node("Flag").play()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if global.checkpoint == self:
		return
	
	if body.get_name() == "Player":
		get_node("Area2D").monitoring = false
		
		get_node("NoFlag").visible = false
		get_node("Flag").visible = true
		
		get_node("Checkpoint").play()
		
		global.checkpoint = self
