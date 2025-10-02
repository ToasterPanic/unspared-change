extends Node2D

@onready var stopwatchntLayer = get_parent().get_parent().get_node("Level/StopwatchntLayer")
@onready var stopwatchLayer = get_parent().get_parent().get_node("Level/StopwatchLayer")

var activeTimer = null

func _ready() -> void:
	stopwatchLayer.visible = false

func _timer_end():
	stopwatchLayer.visible = false
	stopwatchLayer.collision_enabled = false
	
	stopwatchntLayer.visible = true
	stopwatchntLayer.collision_enabled = true
	
	$Area2D.monitoring = true
	
	modulate.a = 1
	
	activeTimer.queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if activeTimer:
		return
		
	if body.get_name() == "Player":
		stopwatchLayer.visible = true
		stopwatchLayer.collision_enabled = true
		
		stopwatchntLayer.visible = false
		stopwatchntLayer.collision_enabled = false
		
		modulate.a = 0.5
		
		$Area2D.monitoring = false
		
		$ClockTicking.play()
		
		activeTimer = Timer.new()
		add_child(activeTimer) 
		
		activeTimer.set_wait_time(8.8) # 2-second delay
		activeTimer.set_one_shot(true)
		
		activeTimer.connect("timeout", _timer_end)
		
		activeTimer.start()
