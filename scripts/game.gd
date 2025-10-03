extends Node2D

var cameraZoomTarget = .5

@onready var currentParallax = $Parallaxes/Parallax
@onready var parallaxes = $Parallaxes.get_children()

@onready var player = get_node("Player")

func checkpoint(point: String) -> void:
	var node = $Interactables.get_node(point)
	
	if not node:
		node = $Interactables/Easy.get_node(point)
		
	if not node:
		LimboConsole.error("Couldn't find checkpoint with the name " + point + "!")
		return
		
	if not node.get_node("NoFlag"):
		LimboConsole.error("Couldn't find checkpoint with the name " + point + "!")
		return
		
	global.checkpoint = node
		
	LimboConsole.info("Set checkpoint to " + point)

func _ready() -> void:
	if global.difficulty != "easy":
		get_node("Level/EasyModeLayer").free()
		get_node("Interactables/Easy").free()
	
	if global.difficulty == "hardcore":
		for n in $Interactables.get_children():
			if n.get_node("NoFlag"):
				if n.get_name() != "1-1":
					n.queue_free()
	else:
		get_node("Level/HardcoreModeLayer").free()
		get_node("Interactables/Hardcore").free()
	
	LimboConsole.register_command(checkpoint)
		
func _physics_process(delta: float) -> void:
	player.get_node("Camera2D").zoom.x -= (player.get_node("Camera2D").zoom.x - cameraZoomTarget) * delta
	player.get_node("Camera2D").zoom.y = player.get_node("Camera2D").zoom.x
	
func _process(delta: float) -> void:
	for n in parallaxes:
		if n == currentParallax:
			n.modulate.a -= (n.modulate.a - 1) * delta
		else:
			n.modulate.a -= (n.modulate.a - 0) * delta


func _on_zoom_camera_out_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		cameraZoomTarget = 0.5


func _on_zoom_camera_in_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		cameraZoomTarget = 1.333


func _on_fade_parallax_2_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		currentParallax = $Parallaxes/Parallax2


func _on_fade_parallax_3_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		currentParallax = $Parallaxes/Parallax3


func _on_the_end_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		$Player.freeze = true
		$CanvasLayer/Control/TheEnd.visible = true
