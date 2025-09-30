extends Node2D

var cameraZoomTarget = .5

@onready var player = get_node("Player")

func _ready() -> void:
	if global.hardcore_mode:
		get_node("Level/EasyModeLayer").free()
		
func _physics_process(delta: float) -> void:
	player.get_node("Camera2D").zoom.x -= (player.get_node("Camera2D").zoom.x - cameraZoomTarget) * delta
	player.get_node("Camera2D").zoom.y = player.get_node("Camera2D").zoom.x


func _on_zoom_camera_out_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		cameraZoomTarget = 0.5


func _on_zoom_camera_in_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		cameraZoomTarget = 1.333
