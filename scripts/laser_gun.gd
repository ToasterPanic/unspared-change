extends Node2D

var timeSinceLastSpawn = 0
var laser = preload("res://scenes/laser.tscn")

func _physics_process(delta: float) -> void:
	timeSinceLastSpawn += delta
	if timeSinceLastSpawn >= get_meta("interval"):
		timeSinceLastSpawn = 0
		
		var newLaser = laser.instantiate()
		newLaser.name = "Laser"
		
		get_parent().add_child(newLaser)
		
		newLaser.position = position
		
		newLaser.linear_velocity = -(transform.y * 1024)
		newLaser.rotation = rotation
		
		var timer = Timer.new()
		add_child(timer) 
		
		timer.set_wait_time(30) # 2-second delay
		timer.set_one_shot(true)
		
		timer.connect("timeout", newLaser.queue_free)
		
		timer.start()
