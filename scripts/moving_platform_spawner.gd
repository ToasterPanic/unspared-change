extends Node2D

var timeSinceLastSpawn = 0
var platform = preload("res://scenes/moving-platform.tscn")

func _physics_process(delta: float) -> void:
	timeSinceLastSpawn += delta
	if timeSinceLastSpawn >= get_meta("interval"):
		timeSinceLastSpawn = 0
		
		var newPlatform = platform.instantiate()
		
		get_parent().add_child(newPlatform)
		
		newPlatform.position = position
		
		newPlatform.set_meta("horizontial_speed", get_meta("horizontial_speed"))
		newPlatform.set_meta("vertical_speed", get_meta("vertical_speed"))
		
		var timer = Timer.new()
		add_child(timer) 
		
		timer.set_wait_time(get_meta("lifetime")) # 2-second delay
		timer.set_one_shot(true)
		
		timer.connect("timeout", newPlatform.queue_free)
		
		timer.start()
